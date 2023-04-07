import 'package:flutter/material.dart';
import 'package:instagram_clone_ys/post/post.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone_ys/advertisement/advertising_provider.dart';

class AdvertWidget extends StatelessWidget {
  final PostHead head;
  final PostContent content;
  final PostTail tail;
  const AdvertWidget(
      {Key? key, required this.head, required this.content, required this.tail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[head, content, const DetailsButton(), tail]);
  }
}

class DetailsButton extends StatelessWidget {
  const DetailsButton({Key? key}) : super(key: key);

  showAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(content: Text('Виникла помилка'));
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 40,
        child: ElevatedButton(
          onPressed: () async {
            var url = Uri.parse(
                Provider.of<AdvertisingProvider>(context, listen: false).siteAddress1);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              showAlertDialog(context);
            }
          },
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Детальніше',
              textAlign: TextAlign.left,
            ),
          ),
        ));
  }
}
