import 'package:flutter/material.dart';
import 'post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostGrid extends StatelessWidget {
  const PostGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 1.5,
                  childAspectRatio: 1),
              shrinkWrap: true,
              itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot snap = (snapshot.data! as dynamic).docs[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostPage(
                          tag: index,
                          postPhoto: (snap.data()! as dynamic)['post'],
                          nickname: (snap.data()! as dynamic)['nickname'],
                          location: '',
                          photo: (snap.data()! as dynamic)['accountPhoto'],
                          likes: (snap.data()! as dynamic)['likes'],
                          text: '',
                        ),
                      ),
                    );
                  },
                  child: Hero(
                    tag: index,
                    child: Image(
                      image:
                      NetworkImage((snap.data()! as dynamic)['post']),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              });
        });
  }
}

class PostPage extends StatelessWidget {
  final int tag;
  final String photo;
  final String nickname;
  final String location;
  final String postPhoto;
  final int likes;
  final String text;
  const PostPage(
      {Key? key,
        required this.tag,
        required this.photo,
        required this.nickname,
        required this.location,
        required this.postPhoto,
        required this.likes,
        required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          title: const Text('Дописи'),
        ),
        body:  Hero(
            tag: tag,
            child: Post(
              head: PostHead(
                image: NetworkImage(photo),
                nickName: nickname,
                location: location,
              ),
              content: PostContent(
                accountImage: NetworkImage(photo),
                image: NetworkImage(postPhoto),
                nickName: nickname,
                likes: likes.toString(),
                postText: text,
              ),
            )));
  }
}