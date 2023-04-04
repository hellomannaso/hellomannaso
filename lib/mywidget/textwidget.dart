import 'package:flutter/material.dart';

class MyTextWidget extends StatelessWidget {
  final String text;

  MyTextWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
