import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_ys/settings/settings_item.dart';
import 'package:instagram_clone_ys/settings/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsMenu extends StatefulWidget {
  int max_time = 10;
  SettingsMenu({Key? key}) : super(key: key);

  @override
  State<SettingsMenu> createState() => _SettingsMenuState();
}

class _SettingsMenuState extends State<SettingsMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
           DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            child:Padding(padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Row(
                    children: [
                      IconButton(
                          onPressed: (){
                            Beamer.of(context).popRoute();
                          },
                          icon: const Icon(Icons.arrow_back)),
                      const Text(
              'Налаштування',
              style: TextStyle(fontSize: 25),
            )])),
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
            IconButton(onPressed: () async{
              var a = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>
                      SettingsItem(title: 'Нагляд',)));
              setState(() {
                widget.max_time = a;
              });
            }, icon: const Icon(Icons.people)),
             Expanded(
                child: Row(
                children: [
                  const Text(
                  'Нагляд'
                ),
                const SizedBox(width: 5),
                Text(widget.max_time.toString())]))
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
            IconButton(onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            }, icon: const Icon(Icons.format_paint)),
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
