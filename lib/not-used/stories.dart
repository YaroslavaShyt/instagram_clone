import 'package:flutter/material.dart';

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
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Text(text, style: const TextStyle(fontSize: 12)))
        ]));
  }
}