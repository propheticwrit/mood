import 'package:flutter/material.dart';

class Survey extends StatelessWidget {
  final String text;

  Survey({required this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('My text is: $text'),
      ),
    );
  }
}
