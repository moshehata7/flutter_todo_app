import 'package:flutter/material.dart';
import 'package:todo_app/screens/update_task_screen.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isPressed =false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return UpdateTaskScreen();
              },
            ),
          );
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 10,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              ListTile(
                leading: IconButton(onPressed: (){
                  setState(() {
                    isPressed =!isPressed;
                  });
                },
                
                 icon:isPressed ==true ? Icon(Icons.check_box) : Icon(Icons.check_box_outline_blank) ,
                 
                
                ),
                title: Text(
                  "title",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "content",
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        Text(
                          "11:55 PM",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          " fri 6 ,oct, 2025 ",
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
