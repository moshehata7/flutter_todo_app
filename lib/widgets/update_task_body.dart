import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubits/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/custom_button.dart';
import 'package:todo_app/widgets/time_date_text_field.dart';

class UpdateTaskBody extends StatefulWidget {
  const UpdateTaskBody({super.key, required this.task});
    final TaskModel task;

  @override
  State<UpdateTaskBody> createState() => _UpdateTaskBodyState();
}

class _UpdateTaskBodyState extends State<UpdateTaskBody> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
    String? title, note, time, date;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Text(
              "Update New Task",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            TextField(
              onChanged: (value) {
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
                labelText: "Update planing ?",
                hintText: widget.task.title,
              ),
            ),
            Divider(indent: 35, endIndent: 35),
            TextFormField(
              onChanged: (value) {
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
                      child: Text("New Note ?"),
                    ),
                  ],
                ),
                hintText: widget.task.note,
                contentPadding: EdgeInsets.symmetric(horizontal: 32),
                border: InputBorder.none,
              ),
            ),
              Padding(
              padding: const EdgeInsets.all(8.0),
              child: TimeDateTextField(
                icon: Icon(Icons.calendar_today),
                onPressed: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    timeController.text = pickedTime.format(context);
                  }
                },

                onSaved: (value) {
                  time = value;
                },
                hintText: "New time..? ",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TimeDateTextField(
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
                onSaved: (value) {
                  date = value;
                },
                hintText: "New Date..?",
                icon: Icon(Icons.date_range),
              ),
            ),
            SizedBox(height: 30),
            CustomButton(
              buttonName: "Update Task",
              onTap: () {
                widget.task.title = title ?? widget.task.title;
                widget.task.note = note ?? widget.task.note;
                widget.task.time = time ?? widget.task.time;
                widget.task.date = date ?? widget.task.date;
                widget.task.save();
                BlocProvider.of<FetchTasksCubit>(context).fetchAllTasks();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
  }
}