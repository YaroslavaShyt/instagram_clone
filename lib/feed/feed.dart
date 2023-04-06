import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../advertisement/advertising_provider.dart';
import 'feed_scroll_page.dart';
import '../search/search.dart';
import '../not-used/add_photo.dart';
import '../not-used/reels.dart';
import '../main_page/user_page.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  PageController controller = PageController();
  List<Widget> tabs = [
    FutureProvider(
      create: (context) async {
        final provider = AdvertisingProvider();
        await provider.fetchData();
        return provider;
      },
      builder: (context, child) {
        return const FeedScrollPage();
      },
      initialData: null,
    ),
    SearchPage(),
    const AddPhoto(),
    const Reels(),
    const UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          controller: controller,
          children: tabs,
        ),
        bottomNavigationBar: CupertinoTabBar(
          border:
              const Border(top: BorderSide(width: 0.1, color: Colors.white)),
          backgroundColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Icon(
                    Icons.home,
                    color: Colors.white,
                  )),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ))),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(
                      Icons.add_box_outlined,
                      color: Colors.white,
                    ))),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ))),
            BottomNavigationBarItem(
                icon: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    ))),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            controller.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 100),
                curve: Curves.linear);
          },
        ));
  }
}
