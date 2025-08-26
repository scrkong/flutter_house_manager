import 'package:flutter/material.dart';
import 'package:flutter_house_manager/pages/House/index.dart';
import 'package:flutter_house_manager/pages/NoticeDetail/index.dart';
import 'package:flutter_house_manager/pages/TabsPage/index.dart';
import 'package:flutter_house_manager/pages/Utils/TokenManager.dart';
import 'package:flutter_house_manager/pages/login/index';
import 'package:flutter_house_manager/pages/profile/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    routes: {
      "/": (context) => const TabsPage(),
      "/noticeDetail": (context) => const NoticelDetail(),
      "/login": (context) => const LoginPage(),
    },
    initialRoute: "/",
    onGenerateRoute: (settings) {
      String token = tokenManager.getToken();
      if (token.isEmpty) {
        return MaterialPageRoute(builder: (context) => const LoginPage()
        );
      }
      if (settings.name == "/profile") {
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      }
      if (settings.name == "/noticeDetail") {
        return MaterialPageRoute(builder: (context) => const NoticelDetail());
      }
    },
  );
}
