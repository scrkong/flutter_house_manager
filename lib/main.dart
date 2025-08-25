import 'package:flutter/material.dart';
import 'package:flutter_house_manager/pages/TabsPage/index.dart';

void main() {
  runApp(MaterialApp(
    routes: {"/": (context) => const TabsPage()},
    initialRoute: "/",
  ));
}
