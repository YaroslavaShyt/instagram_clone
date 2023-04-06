import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../post/post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone_ys/advertisement/advertising_provider.dart';
import 'package:instagram_clone_ys/advertisement/advertisement_widget.dart';

class FeedScrollPage extends StatefulWidget {
  const FeedScrollPage({super.key});

  @override
  _FeedScrollPageState createState() => _FeedScrollPageState();
}

class _FeedScrollPageState extends State<FeedScrollPage> {
  List<DocumentSnapshot> documents = [];
  late String res;

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
    if (documents.isEmpty ||
        Provider.of<AdvertisingProvider?>(context)?.text == null) {
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
        body: ListView.builder(
            itemCount: documents.length,
            itemBuilder: (context, index) {
              if (index % 2 == 0) {
                return AdvertWidget(
                  head: PostHead(
                    image: Provider.of<AdvertisingProvider>(context).logo,
                    nickName: Provider.of<AdvertisingProvider>(context).title ??
                        'test-title',
                    location: 'Реклама',
                  ),
                  content: PostContent(
                    id: '',
                    tag: 1,
                    image: Provider.of<AdvertisingProvider>(context).imgSrc,
                  ),
                  tail: PostTail(
                    id: '',
                    accountImage:
                        Provider.of<AdvertisingProvider?>(context)?.logo,
                    nickName: Provider.of<AdvertisingProvider>(context).title ??
                        'test-title',
                    likes: '10000',
                    postText: Provider.of<AdvertisingProvider>(context).text,
                  ),
                );
              }
              return Post(
                  head: PostHead(
                    image: (documents[index].data()
                        as Map<String, dynamic>)['accountPhoto'],
                    nickName: (documents[index].data()
                        as Map<String, dynamic>)['nickname'],
                    location: (documents[index].data()
                        as Map<String, dynamic>)['location'],
                  ),
                  content: PostContent(
                    id: documents[index].id,
                    tag: 1,
                    image: (documents[index].data()
                        as Map<String, dynamic>)['photo'],
                  ),
                  tail: PostTail(
                    id: documents[index].id,
                    accountImage: (documents[index].data()
                        as Map<String, dynamic>)['accountPhoto'],
                    nickName: (documents[index].data()
                        as Map<String, dynamic>)['nickname'],
                    likes: (documents[index].data()
                            as Map<String, dynamic>)['likes']
                        .toString(),
                    postText: (documents[index].data()
                        as Map<String, dynamic>)['content'],
                  ));
            }));
  }
}
