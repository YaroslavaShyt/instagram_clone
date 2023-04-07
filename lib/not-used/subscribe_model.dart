import 'package:flutter/material.dart';

class SubscribeUnsubscribeModel extends ChangeNotifier{
  int _contactSubscribers = 200;
  int _mySubscriptions = 100;
  bool _isFollowed = false;

  get contactSubscribers => _contactSubscribers;

  get mySubscriptions => _mySubscriptions;

  get isFollowed => _isFollowed;

  void subscribe(){
    _mySubscriptions ++;
    _contactSubscribers ++;
    _isFollowed = true;
    notifyListeners();
  }

  void unsubscribe(){
    _mySubscriptions --;
    _contactSubscribers --;
    _isFollowed = false;
    notifyListeners();
  }


}