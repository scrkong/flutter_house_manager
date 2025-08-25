import 'package:flutter/material.dart';
import 'package:flutter_house_manager/pages/Home/index.dart';
import 'package:flutter_house_manager/pages/Mine/index';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _currentIndex = 0;
  final List _tabList = [
    {
      "label": '首页',
      "icon": "assets/tabs/home_default.png",
      "active_icon": "assets/tabs/home_active.png"
    },
    {
      "label": '我的',
      "icon": "assets/tabs/my_default.png",
      "active_icon": "assets/tabs/my_active.png"
    }
  ];
  List<BottomNavigationBarItem> getTabsBar() {
    List<BottomNavigationBarItem> tabList = [];
    for (var i = 0; i < _tabList.length; i++) {
      tabList.add(BottomNavigationBarItem(
        icon: Image.asset(_tabList[i]["icon"], width: 30, height: 30),
        activeIcon:
            Image.asset(_tabList[i]["active_icon"], width: 30, height: 30),
        label: _tabList[i]["label"],
      ));
    }
    return tabList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: IndexedStack(
        index: _currentIndex,
        children: const [HomeView(), MineView()],
      )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: getTabsBar(),
      ),
    );
  }
}
