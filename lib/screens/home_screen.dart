import 'package:flutter/material.dart';
import 'package:todo_app/widgets/todo_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        surfaceTintColor: Colors.white,
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        bottom: PreferredSize(preferredSize: Size.fromHeight(30),
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("TaskNest",style: TextStyle(fontSize: 25,color: Colors.white),),
         )),
        elevation: 6,
         shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(50),
    ),
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
