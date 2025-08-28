import 'package:flutter/material.dart';
import 'package:todo_app/widgets/task_item.dart';

class ToDoBody extends StatelessWidget {
  const ToDoBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.circle_outlined),
                  Text("MyTasks", style: TextStyle(fontSize: 30)),
                ],
              ),
              Text(
                "1 of 3 ",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return TaskItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
