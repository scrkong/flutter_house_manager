import 'package:flutter/material.dart';
import 'package:flutter_house_manager/pages/Home/components/HomeList.dart';
import 'package:flutter_house_manager/pages/Home/components/HomeNav.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
          children: [
            Homenav(),
            Image.asset("assets/images/banner@2x.jpg"),
            Homelist()
          ],
        ),
      ),
    );
  }
}
