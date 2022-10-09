// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dronaidapp/constants.dart';
import 'Background.dart';
import 'package:flutter/services.dart';
import 'package:dronaidapp/components/RoundInputField.dart';

class Body2 extends StatefulWidget {
  Body2({Key? key}) : super(key: key);


  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> {
  TextEditingController agecontroller = TextEditingController();
  TextEditingController bloodcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // var idk = MediaQuery.of(context).viewInsets.bottom;
    Size size = MediaQuery.of(context).size;
    return background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
              ),
              SvgPicture.asset(
                'assets/icons/signup.svg',
                height: size.height * 0.35,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: size.width*0.04,right: size.width*0.04),
                shrinkWrap: true,
                children: [
                  RoundedInputField(
                    chld: TextField(
                      controller: agecontroller,
                      keyboardType: TextInputType.phone,
                      autofocus: true,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Enter Age",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  RoundedInputField(
                    chld: TextField(
                      controller: weightcontroller,
                      keyboardType: TextInputType.phone,
                      autofocus: true,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Enter Weight",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  RoundedInputField(
                    chld: TextField(
                      controller: heightcontroller,
                      keyboardType: TextInputType.phone,
                      autofocus: true,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.phone,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Enter Height",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  RoundedInputField(
                    chld: TextField(
                      controller: bloodcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      autofocus: true,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Enter Blood Group",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    width: size.width*0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 42),
                          child: Text('SIGNUP',
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                        ),
                        onPressed: (){
                          // postdata();
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.3,
                  ),
                ],
              ),
            ],
          ),
        ),);
  }
}