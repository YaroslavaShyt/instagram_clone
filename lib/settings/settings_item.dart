import 'package:flutter/material.dart';

import '../feed/feed.dart';

class SettingsItem extends StatefulWidget {
  final String title;

  SettingsItem({Key? key, required this.title}) : super(key: key);

  @override
  State<SettingsItem> createState() => _SettingsItemState();
}

class _SettingsItemState extends State<SettingsItem> {
  int value = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context, value);
                    },
                  ),
                  Expanded(
                      child: Text(
                    widget.title,
                    style: const TextStyle(fontSize: 25),
                    maxLines: 2,
                  ))
                ]))),
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Ваш максимальний дозволений екранний час у додатку Instagram:\n${value}'),
            OutlinedButton(onPressed: (){
              setState(() {
                value ++;
              });
            }, child: const Text('Збільшити час'))
          ])
      ],
    )),
    );
  }
}
