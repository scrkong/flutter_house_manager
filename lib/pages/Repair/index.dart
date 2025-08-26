import 'package:flutter/material.dart';

class RepairView extends StatefulWidget {
  const RepairView({super.key});

  @override
  State<RepairView> createState() => _RepairViewState();
}

class _RepairViewState extends State<RepairView> {
  final List<Map<String, dynamic>> repairList = [
    {
      'id': '001',
      'title': '水龙头漏水',
      'description': '厨房水龙头持续滴水，需要维修',
      'status': '处理中',
      'date': '2024-01-15',
      'statusColor': Colors.orange,
    },
    {
      'id': '002', 
      'title': '电灯不亮',
      'description': '客厅主灯无法正常开启',
      'status': '已完成',
      'date': '2024-01-10',
      'statusColor': Colors.green,
    },
    {
      'id': '003',
      'title': '门锁故障',
      'description': '入户门锁偶尔无法正常开启',
      'status': '待处理',
      'date': '2024-01-20',
      'statusColor': Colors.red,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的报修'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: repairList.length,
              itemBuilder: (context, index) {
                final repair = repairList[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              repair['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: repair['statusColor'],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                repair['status'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          repair['description'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '报修时间: ${repair['date']}',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddRepairDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddRepairDialog() {
    final titleController = TextEditingController();
    final descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('新增报修'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: '问题标题',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: '问题描述',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('取消'),
          ),
          ElevatedButton(
            onPressed: () {
              if (titleController.text.isNotEmpty) {
                setState(() {
                  repairList.insert(0, {
                    'id': DateTime.now().millisecondsSinceEpoch.toString(),
                    'title': titleController.text,
                    'description': descController.text,
                    'status': '待处理',
                    'date': DateTime.now().toString().substring(0, 10),
                    'statusColor': Colors.red,
                  });
                });
                Navigator.pop(context);
              }
            },
            child: const Text('提交'),
          ),
        ],
      ),
    );
  }
}