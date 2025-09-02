import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/widgets/custom_floating_action_button.dart';
import 'package:todo_app/widgets/home_screen_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchTasksCubit>(context).fetchAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:CustomFloatingActionButton(),
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
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<FetchTasksCubit>(context).deleteAllTasks();
            },
            icon: Icon(Icons.delete_outline_outlined, size: 35),
          ),
        ],
      ),
      body: HomeScreenBody()
    );
  }
}
