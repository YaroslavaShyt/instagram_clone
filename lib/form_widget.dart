import 'package:flutter/material.dart';


class FormWidget extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  bool flag;
  FormWidget(
      {Key? key,
      required this.title,
      required this.controller,
      this.flag = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (title == 'Пароль') {
      flag = true;
    }
    return TextFormField(
      obscureText: flag,
      controller: controller,
      decoration: InputDecoration(
          labelText: title,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Colors.black12, width: 1.0))),
    );
  }
}

