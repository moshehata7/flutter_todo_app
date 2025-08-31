import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/cubits/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/custom_button.dart';

class AddNewTaskBody extends StatefulWidget {
  const AddNewTaskBody({super.key});

  @override
  State<AddNewTaskBody> createState() => _AddNewTaskBodyState();
}

class _AddNewTaskBodyState extends State<AddNewTaskBody> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  String? title, note, time, date;
  final GlobalKey<FormState> keyForm = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: keyForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(
              "Add New Task",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "filled is required";
                } else {
                  null;
                }
              },
              onSaved: (value) {
                title = value;
              },
              style: TextStyle(fontSize: 25),
              cursorHeight: 35,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 32,
                  horizontal: 20,
                ),
                labelText: "What are you planing ?",
              ),
            ),
            Divider(indent: 35, endIndent: 35),
            TextFormField(
              onSaved: (value) {
                note = value;
              },
              keyboardType: TextInputType.multiline,
              maxLines: 3,
              decoration: InputDecoration(
                label: Row(
                  children: [
                    Icon(Icons.sticky_note_2_sharp),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text("Add Note"),
                    ),
                  ],
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 32),
                border: InputBorder.none,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                readOnly: true,

                onSaved: (value) {
                  time = value;
                },
                controller: timeController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        timeController.text = pickedTime.format(context);
                      }
                    },
                    icon: Icon(Icons.access_time),
                  ),
                  hintText: "Time",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                readOnly: true,

                onSaved: (value) {
                  date = value;
                },
                controller: dateController,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () async {
                      DateTime? PickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (PickedDate != null) {
                        dateController.text =
                            "${PickedDate.day}-${PickedDate.month}-${PickedDate.year}";
                      }
                    },
                    icon: Icon(Icons.calendar_today),
                  ),
                  hintText: "Date",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            CustomButton(
              buttonName: "Add Task",
              onTap: () {
                if (keyForm.currentState!.validate()) {
                  keyForm.currentState!.save();
                  var task = TaskModel(
                    title: title!,
                    note: note!,
                    date: DateTime.now().toString(),
                    time: TimeOfDay.now().toString(),
                  );
                  BlocProvider.of<AddTaskCubit>(context).addTask(task);
                  BlocProvider.of<FetchTasksCubit>(context).fetchAllTasks();
                  Navigator.pop(context);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
