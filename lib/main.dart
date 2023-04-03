import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme_provider.dart';
import 'subscribe_model.dart';
import 'feed/feed.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs){
    var isDarkMode = prefs.getBool('isDarkTheme') ?? false;
    runApp( ChangeNotifierProvider(
      create: (context) => ThemeProvider(isDarkMode: isDarkMode),
      child: const MyApp())
    );}
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeProvider, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Instagram clone YS',
              theme: themeProvider.getTheme,
              home: const Feed() //const LogIn()
          );
        });
  }
}
