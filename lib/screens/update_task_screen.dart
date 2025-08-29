import 'package:flutter/material.dart';
import 'package:todo_app/widgets/new_task_body.dart';

class UpdateTaskScreen extends StatelessWidget {
  const UpdateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
      
      ),
      body: NewTaskBody(titleOfScreen: "Update Task",),
    ); ;
  }
}