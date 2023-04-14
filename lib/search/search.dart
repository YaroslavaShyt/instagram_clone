import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_ys/add_photo/add_photo.dart';
import '../feed/feed.dart';
import '../user_page/contacts.dart';

class SearchPage extends StatefulWidget {

  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var wait_result = '';

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('person').snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            body: SafeArea(
                child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(children: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {},
                        ),
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: const InputDecoration(
                              hintText: 'Шукати',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ]),
                    )),
                ContactCardRow(
                    accountPhoto: snapshot.data!.docs[0].data()['accountPhoto'],
                    nickname: snapshot.data!.docs[0].data()['nickname'],
                    nameSurname:
                        '${snapshot.data!.docs[0].data()['name']} ${snapshot.data!.docs[0].data()['surname']}'),

              ],
            )),
          );
        });
  }
}
