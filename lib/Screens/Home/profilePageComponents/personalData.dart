import 'package:dronaidapp/constants.dart';
import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../components/profileCardWidget.dart';

class PersonalData extends StatefulWidget {
  static const String id = "personalData";

  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xff000162),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF2F3FC),
        title: const Text(
          "Personal Data",
          style: TextStyle(
            color: Color(0xff000162),
          ),
        ),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F3FC),
      body: ListView(
        shrinkWrap: true,
        children: [
          Column(
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/images/profilepicture.png'),
              ),
              const SizedBox(
                height: 20.0,
                width: 250.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
