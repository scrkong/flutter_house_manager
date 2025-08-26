import 'package:flutter/material.dart';
import 'package:flutter_house_manager/pages/profile/index.dart';

import 'pages/House/index.dart';
import 'pages/NoticeDetail/index.dart';
import 'pages/TabsPage/index.dart';
import 'pages/login/index';

void main() {
  runApp(MaterialApp(
    routes: {
      "/": (context) => const TabsPage(),
      "/house": (context) => const HouseView(),
      "/noticeDetail": (context) => const NoticelDetail(),
      "/login": (context) => const LoginPage(),
      "/profile": (context) => const ProfilePage(),
    },
    initialRoute: "/",
  ));
}
