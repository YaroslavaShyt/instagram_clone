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
                accountPhoto:'https://firebasestorage.googleapis.com/v0/b/flutterinstagramys.appspot.com/o/20210722_133655.jpg?alt=media&token=da9d86f2-ecae-40c3-af50-810fa6a2c749',
                nickname: 'marymary',
                nameSurname: 'Maria Photographer')
          ],)
        ),
    );
  }
}
