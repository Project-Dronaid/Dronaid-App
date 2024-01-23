import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dronaidapp/Admin/Screens/adminHome.dart';
import 'package:dronaidapp/Screens/Home/homeScreen.dart';
import 'package:dronaidapp/Screens/Login/loginScreen.dart';
import 'package:dronaidapp/Screens/Login/login_with_phonenumber.dart';
import 'package:dronaidapp/Utils/Utils.dart';
import 'package:dronaidapp/components/url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dronaidapp/components/AlreadyHaveAnAccountCheck.dart';
import 'package:dronaidapp/components/RoundInputField.dart';
import 'package:dronaidapp/constants.dart';
import 'package:dronaidapp/Screens/SignUp/signUp.dart';
import 'package:dronaidapp/Screens/WelcomeScreen/background.dart';

class adminBody extends StatefulWidget {
  static const String id = "adminBody";
  @override
  State<adminBody> createState() => _adminBodyState();
}

class _adminBodyState extends State<adminBody> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool obscureText = true;
  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Utils utils = Utils();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _focus.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'ADMIN LOGIN',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/login.svg',
              height: size.height * 0.35,
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  RoundedInputField(
                    chld: TextField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.mail_outline_outlined,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Enter Email ID",
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
                      controller: passwordcontroller,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: obscureText,
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Color(0xFF6F35A5),
                        ),
                        suffix: GestureDetector(
                          child: Icon(
                            Icons.remove_red_eye_outlined,
                            color: Color(0xFF6F35A5),
                            size: 23,
                          ),
                          onTap: (){
                            setState(() {
                              if(obscureText==true)
                                obscureText = false;
                              else
                                obscureText = true;
                            });
                          },
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.1,vertical: size.height*0.015),
              child: InkWell(
                onTap: (){
                  print(passwordcontroller.text);
                  print(emailcontroller.text);
                  Navigator.pushNamedAndRemoveUntil(context, adminHome.id,ModalRoute.withName('/'));
                  utils.toastmessage("Welcome Admin");
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: loading ? CircularProgressIndicator(strokeWidth: 3, color: Colors.white ,) :
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.001,
            ),


            GestureDetector(
              onTap: (){
                  Navigator.pop(context);
              },
              child: Text("Click here for Customer login",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w700,
                ),),
            ),
          ],
        ),
      ),
    );
  }
}
