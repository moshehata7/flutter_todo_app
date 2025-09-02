import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/screens/add_new_task_screen.dart';
import 'package:todo_app/widgets/task_item.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
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
      body: Padding(
        padding: const EdgeInsets.only(left: 32, bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            
            Row(
              children: [
                Icon(Icons.circle_outlined,color: Colors.purple,),
                Text(" MyTasks", style: TextStyle(fontSize: 30)),
              ],
            ),
            Divider(),
            
            BlocBuilder<FetchTasksCubit, FetchTasksState>(
              builder: (context, state) {
                if (state is FetchTasksSuccess) {
                  final tasksList = state.tasksList;
                  if (tasksList.isEmpty) {
                    if (state.isCleared) {
                      return Expanded(
                        child: Center(
                          child: Image.asset(
                            "assets/images/download.png",
                            height: 200,
                            width: 200,
                          ),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Center(
                          child: Text(
                            "Add your first task!",
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                        ),
                      );
                    }
                  } else {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: tasksList.length,
                        itemBuilder: (context, index) {
                          return TaskItem(task: tasksList[index]);
                        },
                      ),
                    );
                  }
                } else {
                  return const Center(child: Text("No Tasks yet..."));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
