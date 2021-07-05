import 'package:flutter/material.dart';

class Trends extends StatelessWidget {
  final String text;

  Trends({required this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My text is: $text'),
      ),
    );
  }
}
