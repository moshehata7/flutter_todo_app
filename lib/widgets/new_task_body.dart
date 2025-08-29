import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_button.dart';

class NewTaskBody extends StatefulWidget {
  const NewTaskBody({super.key, required this.titleOfScreen, required this.buttonName});
  final String titleOfScreen;
  final String buttonName;

  @override
  State<NewTaskBody> createState() => _NewTaskBodyState();
}

class _NewTaskBodyState extends State<NewTaskBody> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 60),
          Text(
            widget.titleOfScreen,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          TextField(
            readOnly: true,
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
          TextField(
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
            child: TextField(
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
            child: TextField(
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
          SizedBox(height: 30,),
          CustomButton(buttonName: widget.buttonName,)
          
        ],
      ),
    );
  }
}
