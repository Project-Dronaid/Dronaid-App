
import 'package:flutter/material.dart';

import '../constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  AlreadyHaveAnAccountCheck({
    Key? key, this.login = true, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login? 'Don\'t have an Account ?' : 'Already have an Account ? ',
          style: TextStyle(
            color: kPrimaryColor,
          ),),
        GestureDetector(
          onTap: (){
            press();
          },
          child: Text(login? '  Sign-Up':'  Sign-in',
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),),
        ),
      ],
    );
  }
}