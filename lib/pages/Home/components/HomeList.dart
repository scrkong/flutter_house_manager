import 'package:flutter/material.dart';
import 'package:flutter_house_manager/pages/Home/components/Navitem.dart';

class HomeList extends StatefulWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  List _list = [
    {
      "title": '祝愿各位小趴菜能有一份理想的编程工作',
      "content":
          '要到了收获的季节，任何事情都没有百分之百的成功概率， 不能让任何人定义你的未来，但是努力的人一定会有收获，可怜之人必有可恨之处',
      "createAt": "2024-08-22 15:00:00"
    },
    {
      "title": '祝愿各位小趴菜能有一份理想的编程工作',
      "content":
          '要到了收获的季节，任何事情都没有百分之百的成功概率， 不能让任何人定义你的未来，但是努力的人一定会有收获，可怜之人必有可恨之处',
      "createAt": "2024-08-22 15:00:00"
    },
    {
      "title": '祝愿各位小趴菜能有一份理想的编程工作',
      "content":
          '要到了收获的季节，任何事情都没有百分之百的成功概率， 不能让任何人定义你的未来，但是努力的人一定会有收获，可怜之人必有可恨之处',
      "createAt": "2024-08-22 15:00:00"
    }
  ];

  // 头部组件
  Widget getTitleWidget() {
    return Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.asset(
              "assets/images/notice@2x.png",
              width: 25,
              height: 25,
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "社区",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "公告",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
  }

  // 获取列表渲染内容

  Widget getListBuilder() {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: _list.map((item) {
        return NotifyItem(item: item);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [getTitleWidget(), getListBuilder()],
      ),
    );
  }
}
