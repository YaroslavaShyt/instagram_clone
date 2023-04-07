import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';


class AdvertisingProvider extends ChangeNotifier {
  late final http.Response response1;
  late final http.Response response2;
  List imageUrls = [];
  late final String? title;
  late final document;
  late final logo;
  late final imgSrc;
  late Map data;
  List infoData = [];
  String text = 'Наші викладачі:\n';
  bool flag = false;
  String siteAddress1 = 'https://yaroslavashyt.github.io/IT-friendly/';
  String siteAddress2 = 'https://reqres.in/api/users?page=2';

  Future fetchData() async {
    response1 = await http.get(Uri.parse(siteAddress1));
    response2 = await http.get(Uri.parse(siteAddress2));
    if (response1.statusCode == 200 && response2.statusCode == 200) {
      document = parse(response1.body);
      data = json.decode(response2.body);
      getImages();
      getText();
      flag = true;
    }
    notifyListeners();
  }

  void getImages() {
    var images = document.getElementsByTagName('img');
    imgSrc = siteAddress1 + images[1].attributes['src']!;
    logo = siteAddress1 + images[0].attributes['src']!;
  }

  void getText() {
    title = document.head?.querySelector('title')?.text;
    infoData = data["data"];
    for (var i = 0; i < infoData.length; i++){
      text += '${infoData[i]["first_name"]} ${infoData[i]["last_name"]}\n';
    }
    }
  }
