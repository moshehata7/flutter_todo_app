import 'package:flutter/material.dart';
import 'package:todo_app/widgets/add_new_task_body.dart';

class AddNewTaskScreen extends StatelessWidget {
  const AddNewTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
      
      ),
      body: AddNewTaskBody(),
    );
  }
}