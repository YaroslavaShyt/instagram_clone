import 'package:flutter/material.dart';

class CustomMargin extends StatelessWidget {
  final Widget customWidget;
  const CustomMargin({Key? key, required this.customWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: customWidget);
  }
}

class ButtonMargin extends StatelessWidget {
  final Widget customWidget;
  const ButtonMargin({Key? key, required this.customWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 50,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: customWidget);
  }
}

class BottomButtonMargin extends StatelessWidget {
  final Widget customWidget;
  const BottomButtonMargin({Key? key, required this.customWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 50,
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 180),
        child: customWidget);
  }
}

snackBarDisplay(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.black,
    ),
  );
}