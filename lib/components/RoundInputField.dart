import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_dronaid/components/textFieldContainer.dart';
import 'package:project_dronaid/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final int maxLength;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key, required this.hintText, required this.icon, required this.onChanged, required this.maxLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        maxLength: maxLength,
        autofocus: false,
        decoration: InputDecoration(
          counterText: '',
          icon: Icon(icon,
            color: kPrimaryColor,),
          hintText: hintText,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }
}
