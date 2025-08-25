import 'package:flutter/material.dart';

class Homelist extends StatefulWidget {
  Homelist({Key? key}) : super(key: key);

  @override
  _HomelistState createState() => _HomelistState();
}

class _HomelistState extends State<Homelist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("HomeList"),
    );
  }
}
