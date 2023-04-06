import 'package:flutter/material.dart';
import 'package:instagram_clone_ys/post/post.dart';
import '../main_page/contacts.dart';
import 'package:instagram_clone_ys/advertisement/advertising_provider.dart';

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
          ],)
        ),
    );
  }
}
