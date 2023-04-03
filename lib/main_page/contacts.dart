import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:instagram_clone_ys/subscribe_model.dart';

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: const Text('Стежити'),
      onPressed: (){
      },
    );
  }
}



class ContactCard extends StatelessWidget {
  final String accountPhoto;
  final String nickname;
  final String nameSurname;
  const ContactCard({Key? key,
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
        const Button()
      ],
    );
  }
}

class ContactCardRow extends ContactCard {
  const ContactCardRow({super.key,
    required String accountPhoto,
    required String nickname,
    required String nameSurname}) :
        super(
          accountPhoto: accountPhoto,
          nickname: nickname,
          nameSurname: nameSurname);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  CircleAvatar(
        backgroundImage: NetworkImage(accountPhoto),
        radius: 30,
      ),
      title: Text(nickname),
      trailing: const Button(),
    );
  }
}
