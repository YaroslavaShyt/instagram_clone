import 'package:flutter/material.dart';
import 'package:instagram_clone_ys/settings_menu.dart';
import 'post_grid_page.dart';
import 'stories.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.lock),
        title: const Text('yaroslavashyt'),
        backgroundColor: Colors.transparent,
      ),
      endDrawer: const SettingsMenu(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 15),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('images/avatar.jpg'),
                ),
                Column(
                  children:  const [
                    Text(
                      '25',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Дописи'),
                  ],
                ),
                Column(
                  children:const [
                    Text(
                      '1000',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Читачі'),
                  ],
                ),
                Column(
                  children: const[
                    Text(
                      '500',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Відстежую...'),
                  ],
                )
              ]
            )),

          Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: Row(
                children: const [
                  Text(
                      'Yaroslava Shyt\nLypovets-Vinnytsia-Kyiv\nKPI student\nProgrammer')
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 40),
                      backgroundColor: Colors.white24),
                  child: const Text('Редагувати профі...')),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(30, 40),
                      backgroundColor: Colors.white24),
                  child: const Text('Поширити профіль')),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(20, 40),
                      backgroundColor: Colors.white24),
                  child: const Icon(Icons.person_add)),
            ],
          ),
          Row(children: [
            const Stories(
                image: NetworkImage(
                    'https://firebasestorage.googleapis.com/v0/b/flutterinstagramys.appspot.com/o/20210722_133710.jpg?alt=media&token=b7ffb2ef-5614-4597-ac33-e0bc9898adb9'),
                text: 'life'),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.large(
                    onPressed: () {},
                    backgroundColor: Colors.black12,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Створити',
                    style: TextStyle(fontSize: 11),
                  )
                ])
          ]),
          const PostGrid(),
        ],
      ),
    );
  }
}
