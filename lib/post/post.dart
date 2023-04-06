import 'package:flutter/material.dart';

class PostHead extends StatelessWidget {
  final String image;
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
                      backgroundImage: NetworkImage(image),
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
  final String image;
  final int tag;
  final String id;
  const PostContent(
      {Key? key,
      required this.id,
      required this.tag,
      required this.image,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Hero(tag: tag, child: Image(image: NetworkImage(image))),
      ],
    );
  }
}

class PostTail extends StatefulWidget {
  final String id;
  String likes;
  final String nickName;
  final String postText;
  final String accountImage;
  PostTail(
      {Key? key,
      required this.id,
      required this.likes,
      required this.nickName,
      required this.postText,
      required this.accountImage})
      : super(key: key);

  @override
  State<PostTail> createState() => _PostTailState();
}

class _PostTailState extends State<PostTail> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                      icon: const Icon(
                        Icons.favorite_outline_outlined,
                        size: 20,
                      ),
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
              '${widget.likes} вподобань',
              style: const TextStyle(fontSize: 15),
            )),
        Container(
            padding: const EdgeInsets.fromLTRB(15, 8, 0, 0),
            child: RichText(
                text: TextSpan(
                    text: widget.nickName,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold,  color: Theme.of(context).textTheme.bodyLarge?.color),
                    children: [
                  TextSpan(
                    text: widget.postText,
                    style:  TextStyle(
                        fontSize: 16, fontWeight: FontWeight.normal, color: Theme.of(context).textTheme.bodyLarge?.color,),
                  )
                ]))),
        Padding(
            padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(widget.accountImage),
                  )),
               const Text(
                'Додати коментар...',
                style: TextStyle(fontSize: 12),
              )
            ]))
      ],
    );
  }
}

class Post extends StatelessWidget {
  final PostContent content;
  final PostHead head;
  final PostTail tail;
  const Post({Key? key, required this.content, required this.head, required this.tail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[head, content, tail]);
  }
}
