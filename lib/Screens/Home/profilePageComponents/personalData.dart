import 'package:dronaidapp/components/personalDataContainers.dart';
import 'package:dronaidapp/constants.dart';
import 'package:flutter/material.dart';

import '../../../components/constants.dart';
import '../../../components/profileCardWidget.dart';

class PersonalData extends StatefulWidget {
  static const String id = "personalData";
  String gender = "m";
  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  String? dropDownValue = "O+ve";
  var items = [
    "O+ve",
    "A+ve",
    "B+ve",
    "AB+ve",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Hero(
      tag: 'Personal Data',
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
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
          padding: const EdgeInsets.symmetric(horizontal: 30),
          shrinkWrap: true,
          children: [
            Column(
              children: const [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/profilepicture.png'),
                ),
                SizedBox(
                  height: 20.0,
                  width: 250.0,
                ),
              ],
            ),
            const Text(
              "Your Name",
              style: lightBlueTextStyle,
            ),
            DataContainer(
              num: 1,
              childOfContainer: const Text(
                "Sahana Shenoy",
                style: blueTextStyle,
              ),
            ),
            const Text(
              "Email",
              style: lightBlueTextStyle,
            ),
            DataContainer(
              num: 1,
              childOfContainer: const Text(
                "",
                style: blueTextStyle,
              ),
            ),
            const Text(
              "Phone Number",
              style: lightBlueTextStyle,
            ),
            DataContainer(
              num: 1,
              childOfContainer: const Text(
                "",
                style: blueTextStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Age",
                      style: lightBlueTextStyle,
                    ),
                    DataContainer(
                      num: 2.5,
                      childOfContainer: const Text(
                        "20",
                        style: blueTextStyle,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Blood Group",
                      style: lightBlueTextStyle,
                    ),
                    DataContainer(
                      num: 2.5,
                      childOfContainer: DropdownButton(
                        isExpanded: true,
                        underline: const SizedBox(),
                        isDense: true,
                        icon: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xff00078B),
                        ),
                        value: dropDownValue,
                        items: items
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: blueTextStyle,
                                  ),
                                ))
                            .toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              "Gender",
              style: lightBlueTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DataContainer(
                  childOfContainer: Row(
                    children: [
                      // Radio(value: value, groupValue: groupValue, onChanged: onChanged),
                      const Text(
                        "Male",
                        style: blueTextStyle,
                      ),
                    ],
                  ),
                  num: 2.5,
                ),
                DataContainer(
                  childOfContainer: const Text(
                    "Female",
                    style: blueTextStyle,
                  ),
                  num: 2.5,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DataContainer(
                  childOfContainer: const Text(
                    "Other",
                    style: blueTextStyle,
                  ),
                  num: 2.5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
