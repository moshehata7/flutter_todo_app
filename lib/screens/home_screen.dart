import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_new_task_screen.dart';
import 'package:todo_app/widgets/todo_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddNewTaskScreen();
              },
            ),
          );
        },
      ),
      drawer: Drawer(surfaceTintColor: Colors.white),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "TaskNest",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Image.asset("images/task.png", height: 75, width: 75),
              ],
            ),
          ),
        ),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(120)),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(size: 30, Icons.delete_outline),
          ),
        ],
      ),
      body: ToDoBody(),
    );
  }
}
