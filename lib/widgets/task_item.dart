import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/cubits/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/screens/update_task_screen.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({super.key, required this.task});
  final TaskModel task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final date = DateTime.parse(widget.task.date);
    final formattedDate = DateFormat('EEEE, MMM d, yyyy').format(date);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return UpdateTaskScreen(task: widget.task);
              },
            ),
          );
        },
        child: Container(
          height: 115,
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
                leading: Checkbox(
                  value: isPressed,
                  onChanged: (value) {
                  setState(() {
                      isPressed = value!;
                  });
                  },
                ),
                title: isPressed == true
                    ? Text(
                        maxLines: 1,
                        widget.task.title,
                        style: TextStyle(
                          decorationThickness: 2,
                          decoration: TextDecoration.lineThrough,
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Text(
                        widget.task.title,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                subtitle: Text(
                  maxLines: 2,
                  widget.task.note,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                ),
                trailing: IconButton(
                  onPressed: () {
                    widget.task.delete();
                    BlocProvider.of<FetchTasksCubit>(context).fetchAllTasks();
                  },
                  icon: Icon(Icons.delete),
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
                          widget.task.time,
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                        Text(
                          formattedDate,
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
