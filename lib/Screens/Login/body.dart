import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dronaidapp/Screens/Home/homeScreen.dart';
import 'package:dronaidapp/components/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dronaidapp/components/AlreadyHaveAnAccountCheck.dart';
import 'package:dronaidapp/components/RoundInputField.dart';
import 'package:dronaidapp/constants.dart';
import 'package:dronaidapp/Screens/SignUp/signUp.dart';
import 'package:dronaidapp/Screens/WelcomeScreen/background.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String ?user_id;
  String url=PROD_URL+"/user/loginuser";
  bool obscureText = true;

  void postdata() async{
    var dio= Dio();
    var body=jsonEncode({
      "email": emailcontroller.text.toString(),
      "password": passwordcontroller.text.toString(),
    });

    try {
      Response response = await dio.post(url, data: body);
      print(response.data);
      setState((){
        user_id=response.data["_id"];
        print(user_id);
      });

      if(response.statusCode==200){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen()));
        // user_id!
      }
      else if(response.statusCode==400){
        print(response.statusCode);
      }
    }catch(err){
      print(err);
    }
  }

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
              'LOGIN',
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
                  hintText: "Enter Password",
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 42),
                    child: Text('LOGIN',
                      style: TextStyle(
                        color: Colors.white,
                      ),),
                  ),
                  onPressed: (){
                    // postdata();
                    Navigator.pushNamed(context, HomeScreen.id);
                  },
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.pushNamed(context, SignUp.id);
              },
            )
          ],
        ),
      ),
    );
  }
}
