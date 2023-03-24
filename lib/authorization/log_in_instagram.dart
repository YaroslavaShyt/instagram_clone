import 'package:flutter/material.dart';
import 'form_widget.dart';
import 'authentication.dart';
import '../feed/feed.dart';
import '../not used/additional_widgets.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
              child: const Text(
                'Українська',
                style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 14,
                ),
              )),
          const CustomMargin(
              customWidget:
                  Image(height: 90, image: AssetImage('images/inst_logo.png'))),
          Column(children: <Widget>[
            CustomMargin(
                customWidget: FormWidget(
                    title:
                        'Ім\'я користувача, ел. адреса або номер моб. тел...',
                    controller: controllerEmail)),
            CustomMargin(
                customWidget: FormWidget(
                    title: 'Пароль', controller: controllerPassword)),
            ButtonMargin(
              customWidget: OutlinedButton(
                onPressed: () async {
                  String result = await Authentication().logIn(
                      email: controllerEmail.text,
                      password: controllerPassword.text);
                  if (result.isNotEmpty){
                    snackBarDisplay(result, context);
                  }
                  else{ Navigator.of
                  (context).pushReplacement(MaterialPageRoute(builder: (context) => const Feed()));}
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Увійти',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            BottomButtonMargin(
                customWidget: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Забули пароль?',
                      style: TextStyle(color: Colors.white),
                    )))
          ]),
          CustomMargin(
              customWidget: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: null,
            ),
            child: const Text(
              'Створити обліковий запис',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ))
        ],
      ),
    )));
  }
}
