import 'package:flutter/material.dart';
import 'package:flutter_house_manager/pages/Home/components/HomeList.dart';
import 'package:flutter_house_manager/pages/Home/components/HomeNav.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../api/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List _list = [];

  @override
  void initState() {
    super.initState();
    // 获取数据
    getAnnounceList();
  }

  getAnnounceList() async {
    final res = await getAnnounceListAPI();
    _list = res;
    setState(() {});

    // Fluttertoast.showToast(msg: "获取数据成功");
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return AlertDialog(
    //       content: Text(res.toString()),
    //     );
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("享+社区"),
          centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          // 子组件分为三部分
          children: [
            // 导航组件
            Homenav(),
            Image.asset('assets/images/banner@2x.jpg'),
            // 列表组件
            HomeList(list: _list)
          ],
          // 设置列表纵向滚动
        ),
      ),
    );
  }
}
