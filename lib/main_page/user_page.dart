import 'package:flutter/material.dart';
import 'package:instagram_clone_ys/main_page/contacts.dart';
import 'package:instagram_clone_ys/main_page/settings_menu.dart';
import '../post/post_grid_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone_ys/subscribe_model.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('accounts').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
              appBar: AppBar(
                leading: const Icon(Icons.lock),
                title: Text(snapshot.data!.docs[0].data()['nickname']),
                backgroundColor: Colors.transparent,
              ),
              endDrawer: const SettingsMenu(),
              body: UserPageBody(
                snapshot: snapshot,
              ));
        });
  }
}

class UserPageBody extends StatelessWidget {
  final snapshot;
  const UserPageBody({Key? key, required this.snapshot,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data!.docs.length,
      itemBuilder: (context, index) => Column(
        children: [
          Row1(
            accountPhoto: snapshot.data!.docs[index].data()['accountPhoto'],
            posts: snapshot.data!.docs[index].data()['posts'].toString(),
            subscribers: snapshot.data!.docs[index].data()['subscribers'].toString(),
            subscriptions: Provider.of<SubscribeUnsubscribeModel>(context, listen: true).mySubscriptions.toString(),
          ),
          Row2(
            nameSurname: snapshot.data!.docs[index].data()['name'] + ' ' + snapshot.data!.docs[index].data()['surname'],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Row(
                children: [Text(snapshot.data!.docs[index].data()['bio'])],
              )),
          const Row3(),
          Row(
              children: const [
                ContactCard(
                    accountPhoto: 'https://firebasestorage.googleapis.com/v0/b/flutterinstagramys.appspot.com/o/20210722_133655.jpg?alt=media&token=da9d86f2-ecae-40c3-af50-810fa6a2c749',
                    nickname: 'Maria Photographer',
                    nameSurname: 'Марія Фотограф')
              ]),
          const SizedBox(height: 10, width: 10,),
          PostGrid(
              nickName: snapshot.data!.docs[0].data()['nickname'],
              accountPhoto: snapshot.data!.docs[0].data()['accountPhoto']),
        ],
      ),
    );
  }
}

class Row1 extends StatelessWidget {
  final String accountPhoto;
  final String posts;
  final String subscribers;
  final String subscriptions;
  const Row1(
      {Key? key,
        required this.accountPhoto,
        required this.posts,
        required this.subscribers,
        required this.subscriptions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SubscribeUnsubscribeModel>(
        builder: (builder, subscriptions, child){
      return Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 10, 15),
          child:
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(accountPhoto),
                ),
                Column(
                  children: [
                    Text(
                      posts,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text('Дописи'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      subscribers,
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text('Читачі'),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      subscriptions.mySubscriptions.toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    const Text('Відстежую...'),
                  ],
                )
              ]));});
    }
  }


class Row2 extends StatelessWidget {
  final String nameSurname;
  const Row2({Key? key, required this.nameSurname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
        child: Row(
          children: [
            Text(
              nameSurname,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}

class Row3 extends StatelessWidget {
  const Row3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
