import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_ys/log_in_instagram.dart';
import 'search.dart';
import 'feed.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram clone YS',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black54,
        ),
        home: const Feed()//const LogIn()
        );
  }
}
