import 'package:flutter/material.dart';

class Homenav extends StatefulWidget {
  Homenav({Key? key}) : super(key: key);

  @override
  _HomenavState createState() => _HomenavState();
}

class _HomenavState extends State<Homenav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("HomeNav"),
    );
  }
}
