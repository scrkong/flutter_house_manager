import 'package:flutter/material.dart';
import 'package:flutter_house_manager/components/Navcol.dart';

class Homenav extends StatefulWidget {
  Homenav({Key? key}) : super(key: key);

  @override
  _HomenavState createState() => _HomenavState();
}

class _HomenavState extends State<Homenav> {
  List _navList = [
    {"icon": "assets/images/house_nav_icon@2x.png", "title": "我的房屋"},
    {"icon": "assets/images/repair_nav_icon@2x.png", "title": "我的保修"},
    {"icon": "assets/images/visitor_nav_icon@2x.png", "title": "访客登记"}
  ];
  List<Widget> getNavListWidget() {
    return _navList.map((item) {
      return Navcol(icon: item["icon"], title: item["title"]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: getNavListWidget(),
      ),
    );
  }
}
