import 'package:flutter/material.dart';
import '../post/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedScrollPage extends StatefulWidget {
  const FeedScrollPage({super.key});

  @override
  _FeedScrollPageState createState() => _FeedScrollPageState();
}

class _FeedScrollPageState extends State<FeedScrollPage> {
  List<DocumentSnapshot> documents = [];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection('feed').get().then((querySnapshot) {
      setState(() {
        documents = querySnapshot.docs;
      });
    }).catchError((error) => print('Error getting documents: $error'));
  }

  @override
  Widget build(BuildContext context) {
    if (documents.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Instagram',
            style: TextStyle(
              fontSize: 40,
              fontFamily: 'Billabong',
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              icon: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Icon(Icons.favorite_border, color: Colors.white)),
              onPressed: () {},
            ),
            IconButton(
              icon: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Icon(Icons.message_outlined, color: Colors.white)),
              onPressed: () {},
            ),
          ],
        ),
        body:  ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) => Column(
              children: <Widget>[
                Post(
                  head: PostHead(
                    image: NetworkImage((documents[index].data() as Map<String, dynamic>)['accountPhoto']),
                    nickName: (documents[index].data() as Map<String, dynamic>)['nickname'],
                    location: (documents[index].data() as Map<String, dynamic>)['location'],
                  ),
                  content: PostContent(
                    id: documents[index].id,
                    tag: 1,
                    accountImage: NetworkImage((documents[index].data() as Map<String, dynamic>)['accountPhoto']),
                    image: NetworkImage((documents[index].data() as Map<String, dynamic>)['photo']),
                    nickName: (documents[index].data() as Map<String, dynamic>)['nickname'],
                    likes: (documents[index].data() as Map<String, dynamic>)['likes'].toString(),
                    postText: (documents[index].data() as Map<String, dynamic>)['content'],
                  ),
                )
              ],
            )
        )
    );
  }
}