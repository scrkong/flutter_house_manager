import 'package:flutter/material.dart';
import 'package:flutter_house_manager/api/home.dart';
import 'package:flutter_html/flutter_html.dart';

class NoticelDetail extends StatefulWidget {
  const NoticelDetail({Key? key}) : super(key: key);

  @override
  _NoticeDetailState createState() => _NoticeDetailState();
}

class _NoticeDetailState extends State<NoticelDetail> {
  Map<String, dynamic> announceDetail = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final params = ModalRoute.of(context)?.settings.arguments; // 从另外一个生命周期获取参数
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    final params =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    if (params != null && params["id"] != "") {
      getAnnounceDetail(params["id"]);
    }
  }

  getAnnounceDetail(String id) async {
    announceDetail = await getAnnounceDetailAPI(id);
    setState(() {});
  }

  Widget getBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(announceDetail["title"] ?? "",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      announceDetail["creatorName"] ?? "",
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      announceDetail["createdAt"] ?? "",
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                // 富文本组件
                Html(data: announceDetail["content"] ?? "")
              ],
            ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("通知详情"),
      ),
      body: getBody(),
    );
  }
}
