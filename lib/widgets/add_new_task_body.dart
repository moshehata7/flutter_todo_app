import 'package:flutter/material.dart';

class AddNewTaskBody extends StatelessWidget {
  const AddNewTaskBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add New Task",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        TextField(
          decoration: InputDecoration(
            
            labelText: "What are you planing ?"
          ),
        )
      ],
    );
  }
}