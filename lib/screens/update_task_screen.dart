import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/time_date_text_field.dart';
import 'package:todo_app/widgets/update_task_body.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key, required this.task});
  final TaskModel task;

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  String? title, note, time, date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: UpdateTaskBody(task: widget.task,)
    );
  }
}
