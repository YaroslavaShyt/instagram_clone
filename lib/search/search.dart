import 'package:flutter/material.dart';
import '../main_page/contacts.dart';

class SearchPage extends StatelessWidget {
  final controller = TextEditingController();

  SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
        Column(
            children: [
              Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
          child:
          Row(
          children: [
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
            ),]),)),
              const SizedBox(height: 10,),
              const ContactCardRow(
                accountPhoto: 'https://firebasestorage.googleapis.com/v0/b/flutterinstagramys.appspot.com/o/20220427_102231.jpg?alt=media&token=0dffda32-a682-4939-84d5-f5e2d561cdb3',
                nickname: 'katekate',
                nameSurname: 'Katerina Kugak')
          ],)
        ),
    );
  }
}
