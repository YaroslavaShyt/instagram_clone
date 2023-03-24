import 'package:flutter/material.dart';

class SettingsMenu extends StatefulWidget {
  const SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child:Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Text(
              'Налаштування',
              style: TextStyle(fontSize: 25),
            )),
          ),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.person_add)),
            const Expanded(
                child: Text(
              'Стежте за друзями та запрошуйте їх',
              maxLines: 2,
            ))
          ]),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications)),
            const Expanded(
                child: Text(
                  'Сповіщення',
                  maxLines: 2,
                ))
          ]),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.lock)),
            const Expanded(
                child: Text(
                  'Конфіденційність'
                ))
          ]),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.people)),
            const Expanded(
                child: Text(
                  'Нагляд'
                ))
          ]),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.security)),
            const Expanded(
                child: Text(
                  'Безпека'
                ))
          ]),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_chart)),
            const Expanded(
                child: Text(
                  'Реклама'
                ))
          ]),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.account_circle)),
            const Expanded(
                child: Text(
                  'Обліковий запис'
                ))
          ]),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.help_outlined)),
            const Expanded(
                child: Text(
                  'Допомога'
                ))
          ]),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.info)),
            const Expanded(
                child: Text(
                  'Інформація'
                ))
          ]),
          Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.format_paint)),
            const Expanded(
                child: Text(
                  'Тема'
                ))
          ]),
        ],
      ),
    );
  }
}
