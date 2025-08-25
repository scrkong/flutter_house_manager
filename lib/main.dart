import 'package:flutter/material.dart';
import 'package:flutter_house_manager/pages/TabsPage/index.dart';
import 'package:flutter_house_manager/pages/House/index.dart';
import 'package:flutter_house_manager/pages/Visitor/index.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => const TabsPage(),
      "/house": (context) => const HouseView(),
      "/visitor": (context) => const VisitorView(),
    },
    initialRoute: "/",
  ));
}
