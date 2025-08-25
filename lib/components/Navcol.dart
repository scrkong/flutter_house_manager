import 'package:flutter/material.dart';

class Navcol extends StatefulWidget {
  const Navcol({Key? key, required this.icon, required this.title})
      : super(key: key);
  final String icon;
  final String title;

  @override
  _NavcolState createState() => _NavcolState();
}

class _NavcolState extends State<Navcol> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Image.asset(
          widget.icon,
          width: 35,
          height: 35,
        ),
        SizedBox(
          height: 5,
        ),
        Text(widget.title)
      ],
    ));
  }
}
