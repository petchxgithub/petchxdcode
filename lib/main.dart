import 'package:flutter/material.dart';
import 'package:petchxdecode/home.dart';

void main() {
  runApp(Petchxdecode());
}

class Petchxdecode extends StatelessWidget {
  const Petchxdecode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Petchxdecode",
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
