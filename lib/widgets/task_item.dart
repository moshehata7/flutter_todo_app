import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(value: false, onChanged: (value) {}),
      title: Text("title", style: TextStyle()),
      subtitle: Text(
        "title",
        style: TextStyle(fontSize: 12, color: Colors.grey),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("11:55 PM",style: TextStyle(color: Colors.grey,fontSize: 10),),
          Text(" fri 6 ,oct, 2025 ",style: TextStyle(color: Colors.grey,fontSize: 10),)
        ],
      ),
    );
  }
}

