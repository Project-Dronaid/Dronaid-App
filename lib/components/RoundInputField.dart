import 'package:dronaidapp/components/textFieldContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';

class RoundedInputField extends StatelessWidget {
  // final String hintText;
  // final int maxLength;
  // final IconData icon;
  // final ValueChanged<String> onChanged;
  // final TextEditingController cntroller;
  final Widget chld;

  const RoundedInputField({
    Key? key,
    // required this.hintText,
    // required this.icon,
    // required this.onChanged,
    // required this.maxLength,
    // required this. cntroller,
    required this.chld,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: chld,
      // child: TextField(
      //   controller: cntroller,
      //   onChanged: onChanged,
      //   maxLength: maxLength,
      //   autofocus: false,
      //   decoration: InputDecoration(
      //     counterText: '',
      //     icon: Icon(
      //       icon,
      //       color: kPrimaryColor,
      //     ),
      //     hintText: hintText,
      //     enabledBorder: InputBorder.none,
      //     focusedBorder: InputBorder.none,
      //     border: InputBorder.none,
      //   ),
      //   keyboardType: TextInputType.number,
      //   inputFormatters: <TextInputFormatter>[
      //     FilteringTextInputFormatter.digitsOnly
      //   ],
      // ),
    );
  }
}
