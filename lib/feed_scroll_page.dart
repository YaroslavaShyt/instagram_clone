import 'package:flutter/material.dart';
import 'post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedScrollPage extends StatelessWidget {
  const FeedScrollPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: StreamBuilder(
            stream:
            FirebaseFirestore.instance.collection('accounts').snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              return /*Column(children: [
                Expanded(
                    child: */ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => Column(
                    children: <Widget>[
                      /* Column(
                                  children: <Widget>[*/
                      Post(
                        head: PostHead(
                          image: NetworkImage(snapshot
                              .data!.docs[index]
                              .data()['photo']),
                          nickName: snapshot.data!.docs[index]
                              .data()['nickname'],
                          location: snapshot.data!.docs[index]
                              .data()['location'],
                        ),
                        content: PostContent(
                          accountImage: NetworkImage(snapshot
                              .data!.docs[index]
                              .data()['photo']),
                          image: NetworkImage(snapshot
                              .data!.docs[index]
                              .data()['postPhoto']),
                          nickName: snapshot.data!.docs[index]
                              .data()['nickname'],
                          likes: snapshot.data!.docs[index]
                              .data()['likes']
                              .toString(),
                          postText: snapshot.data!.docs[index]
                              .data()['text'],
                        ),
                      )
                    ],
                  )
                /*],
                            )))
              ])*/
              );}));
  }
}
