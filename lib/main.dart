import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/cubits/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>("tasks box");
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddTaskCubit(),
        ),
        BlocProvider(
          create: (context) => FetchTasksCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, home: HomeScreen()));
  }
}
