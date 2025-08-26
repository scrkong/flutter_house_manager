import 'package:flutter/material.dart';
import 'package:flutter_house_manager/pages/Home/components/HomeList.dart';
import 'package:flutter_house_manager/pages/Home/components/HomeNav.dart';

import '../Utils/PromptAction.dart';

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
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Promptaction.showSuccess("成功");
                  },
                  child: Text("成功"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Promptaction.showError("错误");
                  },
                  child: Text("错误"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Promptaction.showWarning("警告");
                  },
                  child: Text("警告"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Promptaction.showToast("提示");
                  },
                  child: Text("提示"),
                ),
              ],
            ),
            Homenav(),
            Image.asset("assets/images/banner@2x.jpg"),
            HomeList()
          ],
        ),
      ),
    );
  }
}
