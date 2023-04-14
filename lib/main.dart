import 'package:beamer/beamer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings/theme_provider.dart';
import 'feed/feed.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkMode = prefs.getBool('isDarkTheme') ?? false;
    runApp(ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDarkMode: isDarkMode),
        builder: (context, child) {
          return MyApp();}));
  });

}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final routerDelegate = BeamerDelegate(
    initialPath: '/feed_scroll_page',
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '*': (context, state, data) => const BottomNavBar(),
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeProvider, child) {
      return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Instagram clone YS',
          theme: themeProvider.getTheme,
          routerDelegate: routerDelegate,
          routeInformationParser: BeamerParser(),
          backButtonDispatcher: BeamerBackButtonDispatcher(
            delegate: routerDelegate
          ),
      );
    });
  }
}
