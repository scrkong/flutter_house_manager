import 'package:flutter/material.dart';

class HouseView extends StatefulWidget {
  const HouseView({Key? key}) : super(key: key);

  @override
  _HouseViewState createState() => _HouseViewState();
}

class _HouseViewState extends State<HouseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的房屋'),
        centerTitle: true,
        backgroundColor: Color(0xFF87CEEB),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '房屋信息',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    _buildInfoRow('小区名称', '享+社区'),
                    _buildInfoRow('楼栋号', 'A栋'),
                    _buildInfoRow('房间号', '1001'),
                    _buildInfoRow('面积', '120㎡'),
                    _buildInfoRow('户型', '三室两厅'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$label：',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}