import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final bool isFollowed;
  final Function incrementSubscriptions;
  final String accountPhoto;
  final String nickname;
  final String nameSurname;
  const ContactCard({Key? key,
    required this.isFollowed,
    required this.incrementSubscriptions,
    required this.accountPhoto,
    required this.nickname,
    required this.nameSurname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(accountPhoto),
          radius: 30,
        ),
        Text(nickname),
        Text(nameSurname),
        OutlinedButton(
          child: isFollowed? const Text('Не стежити') : const Text('Стежити'),
          onPressed: (){incrementSubscriptions();},
        )
      ],
    );
  }
}