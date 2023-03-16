import 'package:flutter/material.dart';

class PostHead extends StatelessWidget {
  final NetworkImage image;
  final String nickName;
  final String location;
  const PostHead({
    Key? key,
    required this.image,
    required this.nickName,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
              child: Row(children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: CircleAvatar(
                      radius: 15,
                      backgroundImage: image,
                    )),
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        nickName,
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        location,
                        style: const TextStyle(fontSize: 10),
                      )
                    ])
              ]),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_outlined,
                size: 20,
              ),
            )
          ],
        ));
  }
}

class PostContent extends StatelessWidget {
  final NetworkImage image;
  final NetworkImage accountImage;
  final String nickName;
  final String likes;
  final String postText;
  const PostContent(
      {Key? key,
        required this.image,
        required this.nickName,
        required this.likes,
        required this.postText,
        required this.accountImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Image(image: image),
        Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border, size: 20),
                      splashRadius: 0.1,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.comment_outlined,
                          size: 20,
                        ),
                        splashRadius: 0.1,
                      )),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send, size: 20),
                        splashRadius: 0.1,
                      ))
                ]),
                const Icon(Icons.bookmark_border),
              ],
            )),
        Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              '$likes вподобань',
              style: const TextStyle(fontSize: 15),
            )),
        Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 0, 0),
            child: RichText(
                text: TextSpan(
                    text: '$nickName ',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: postText,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.normal),
                      )
                    ]))),
        Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: accountImage,
                  )),
              const Text(
                'Додати коментар...',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              )
            ]))
      ],
    );
  }
}

class Post extends StatelessWidget {
  final PostContent content;
  final PostHead head;
  const Post({Key? key, required this.content, required this.head})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[head, content]);
  }
}