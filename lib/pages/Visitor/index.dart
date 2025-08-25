import 'package:flutter/material.dart';

class VisitorView extends StatefulWidget {
  const VisitorView({Key? key}) : super(key: key);

  @override
  _VisitorViewState createState() => _VisitorViewState();
}

class _VisitorViewState extends State<VisitorView> {
  List<Map<String, dynamic>> visitorList = [
    {
      'name': '张三',
      'phone': '138****1234',
      'visitTime': '2024-01-20 14:30',
      'purpose': '朋友聚会',
      'status': '已到访',
      'statusColor': Colors.green,
    },
    {
      'name': '李四',
      'phone': '139****5678',
      'visitTime': '2024-01-21 10:00',
      'purpose': '快递配送',
      'status': '预约中',
      'statusColor': Colors.orange,
    },
    {
      'name': '王五',
      'phone': '137****9012',
      'visitTime': '2024-01-22 16:00',
      'purpose': '家政服务',
      'status': '预约中',
      'statusColor': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('访客记录'),
        centerTitle: true,
        backgroundColor: Color(0xFF87CEEB),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[50],
        child: Column(
          children: [
            // 统计信息
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildStatItem('总访客', '${visitorList.length}', Colors.blue),
                  _buildStatItem('今日预约', '2', Colors.orange),
                  _buildStatItem('已到访', '1', Colors.green),
                ],
              ),
            ),
            // 访客列表
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemCount: visitorList.length,
                itemBuilder: (context, index) {
                  final visitor = visitorList[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.all(16),
                      leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: visitor['statusColor'].withOpacity(0.1),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Icon(
                          Icons.person,
                          color: visitor['statusColor'],
                        ),
                      ),
                      title: Text(
                        visitor['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8),
                          Text(
                            '联系电话：${visitor['phone']}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '访问时间：${visitor['visitTime']}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '访问目的：${visitor['purpose']}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      trailing: Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: visitor['statusColor'],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          visitor['status'],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      onTap: () {
                        _showVisitorDetail(visitor);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewVisitorDialog();
        },
        backgroundColor: Color(0xFF87CEEB),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildStatItem(String label, String count, Color color) {
    return Column(
      children: [
        Text(
          count,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  void _showVisitorDetail(Map<String, dynamic> visitor) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('访客详情'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('访客姓名：${visitor['name']}'),
            SizedBox(height: 8),
            Text('联系电话：${visitor['phone']}'),
            SizedBox(height: 8),
            Text('访问时间：${visitor['visitTime']}'),
            SizedBox(height: 8),
            Text('访问目的：${visitor['purpose']}'),
            SizedBox(height: 8),
            Text('访问状态：${visitor['status']}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('关闭'),
          ),
        ],
      ),
    );
  }

  void _showNewVisitorDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final purposeController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('新增访客'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: '访客姓名',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: '联系电话',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            TextField(
              controller: purposeController,
              decoration: InputDecoration(
                labelText: '访问目的',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('访客预约已添加')),
              );
            },
            child: Text('确定'),
          ),
        ],
      ),
    );
  }
}