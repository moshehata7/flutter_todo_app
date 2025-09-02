import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/widgets/task_item.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            Divider(endIndent: 10,),
            
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
        )]
          
          ));
  }
} 