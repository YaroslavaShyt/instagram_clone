import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../add_photo/add_photo_location.dart';
import '../reels/reels_location.dart';
import '../search/search_location.dart';
import '../user_page/user_page_location.dart';
import 'feed_scroll_page_location.dart';


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex;
  final _routerDelegates = [
    BeamerDelegate(
      initialPath: '/feed_scroll_page',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/feed_scroll_page')) {
          return FeedScrollPageLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/search',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/search')) {
          return SearchLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/add_photo',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/add_photo')) {
          return AddPhotoLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/reels',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/reels')) {
          return ReelsLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
    BeamerDelegate(
      initialPath: '/user_page',
      locationBuilder: (routeInformation, _) {
        if (routeInformation.location!.contains('/user_page')) {
          return UserPageLocation(routeInformation);
        }
        return NotFound(path: routeInformation.location!);
      },
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final uriString = Beamer.of(context).configuration.location!;
    _currentIndex =  uriString.contains('/feed_scroll_page') ? 0:
    uriString.contains('/search') ? 1 :
    uriString.contains('/add_photo') ? 2:
    uriString.contains('/reels')? 3 : 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Beamer(routerDelegate: _routerDelegates[0]),
          Beamer(routerDelegate: _routerDelegates[1]),
          Beamer(routerDelegate: _routerDelegates[2]),
          Beamer(routerDelegate: _routerDelegates[3]),
          Beamer(routerDelegate: _routerDelegates[4])
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
                padding:  EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Icon(Icons.home),),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Padding(
                  padding:  EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Icon(Icons.search),),
              label: '',),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Icon(Icons.add_box_outlined),),
              label: '',)
              ,

          BottomNavigationBarItem(
              icon: Padding(
                  padding:  EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Icon(Icons.camera_alt_outlined),),
              label: '',),
          BottomNavigationBarItem(
              icon: Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Icon(Icons.person),),
              label: '',),
        ],
        onTap: (index){
          if(index != _currentIndex){
            setState(() {
              _currentIndex = index;
            });
            _routerDelegates[_currentIndex].update(rebuild: false);
          }
        },
      ),
    );
  }
}
