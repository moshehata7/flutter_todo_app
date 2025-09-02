import 'package:flutter/material.dart';

class TimeDateTextField extends StatelessWidget {
    TimeDateTextField({super.key, required this.onPressed,required this.onSaved, required this.hintText, required this.icon });
  final TextEditingController controller = TextEditingController();
  final Function(String?)? onSaved;
  final Function() onPressed;
  final String hintText;
  
final Widget icon;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
                readOnly: true,
                onSaved: onSaved ,
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: onPressed,
                    icon: icon,
                  ),
                  hintText: hintText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
  }
}