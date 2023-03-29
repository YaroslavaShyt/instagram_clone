import 'package:flutter/material.dart';

class SubscribeUnsubscribeModel extends ChangeNotifier{
  int _subscriptions = 200;
  bool _isFollowed = false;

  get subscriptions => _subscriptions;

  get isFollowed => _isFollowed;

  void subscribe(){
    _subscriptions ++;
    _isFollowed = true;
    notifyListeners();
  }

  void unsubscribe(){
    _subscriptions --;
    _isFollowed = false;
    notifyListeners();
  }


}