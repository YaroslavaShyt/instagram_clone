import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  bool flag;
  FormWidget({Key? key, required this.title, required this.controller, this.flag = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (title == 'Пароль'){
       flag = true;
    }
    return TextFormField(
      obscureText: flag,
      controller: controller,
      decoration: InputDecoration(
          labelText: title,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.black12, width: 1.0))),
    );
  }
}

class CustomMargin extends StatelessWidget {
  final Widget customWidget;
  const CustomMargin({Key? key, required this.customWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: customWidget);
  }
}

class ButtonMargin extends StatelessWidget {
  final Widget customWidget;
  const ButtonMargin({Key? key, required this.customWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 50,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: customWidget);
  }
}

class BottomButtonMargin extends StatelessWidget {
  final Widget customWidget;
  const BottomButtonMargin({Key? key, required this.customWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 50,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 180),
        child: customWidget);
  }
}

snackBarDisplay(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message, style: TextStyle(color: Colors.white),), backgroundColor: Colors.black,),
  );
}
// will be implemented soon
class Stories extends StatelessWidget {
  final NetworkImage image;
  final String text;
  const Stories({Key? key, required this.image, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
        child: Column(children: <Widget>[
          CircleAvatar(
              radius: 42,
              backgroundColor: Colors.white70,
              child: CircleAvatar(
                  radius: 41.5,
                  backgroundColor: Colors.black,
                  child: CircleAvatar(radius: 37, backgroundImage: image))),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Text(text, style: const TextStyle(fontSize: 12)))
        ]));
  }
}

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
  final String nickName;
  final String likes;
  final String postText;
  const PostContent(
      {Key? key,
      required this.image,
      required this.nickName,
      required this.likes,
      required this.postText})
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
                    backgroundImage: image,
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
