import 'package:flutter/material.dart';
import 'package:project_dronaid/components/textFieldContainer.dart';
import 'package:project_dronaid/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key, required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(child: TextField(
      onChanged: onChanged,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'OTP',
        icon: Icon(Icons.lock,
          color: kPrimaryColor,),
        suffixIcon: Icon(Icons.visibility,
          color: kPrimaryColor,),
        border: InputBorder.none,
      ),
    ),);
  }
}