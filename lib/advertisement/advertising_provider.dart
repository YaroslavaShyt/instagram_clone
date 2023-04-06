import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';


class AdvertisingProvider extends ChangeNotifier {
  late final response;
  List imageUrls = [];
  late final String? title;
  late final document;
  late final logo;
  late final imgSrc;
  String text = '';
  bool flag = false;
  String siteAddress = 'https://yaroslavashyt.github.io/IT-friendly/';

  Future fetchData() async {
    response = await http.get(Uri.parse(siteAddress));
    if (response.statusCode == 200) {
      document = parse(response.body);
      getImages();
      getText();
      flag = true;
    }
    notifyListeners();
  }

  void getImages() {
    var images = document.getElementsByTagName('img');
    imgSrc = siteAddress + images[1].attributes['src']!;
    logo = siteAddress + images[0].attributes['src']!;
  }

  void getText() {
    title = document.head?.querySelector('title')?.text;
    var data = document.getElementsByTagName('p');
    for (var i = 1; i < 5; i++) {
      text += '. ${data[i].text}';
    }
  }
}
