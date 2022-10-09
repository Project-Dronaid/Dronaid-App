import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dronaidapp/Screens/Home/homeScreen.dart';
import 'package:dronaidapp/Utils/Utils.dart';
import 'package:dronaidapp/components/personalDataContainers.dart';
import 'package:dronaidapp/components/url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dronaidapp/components/AlreadyHaveAnAccountCheck.dart';
import 'package:dronaidapp/components/roundedButton.dart';
import 'package:dronaidapp/components/roundedPasswordField.dart';
import 'package:dronaidapp/constants.dart';
import 'package:dronaidapp/components/OrDivider.dart';
import 'package:dronaidapp/Screens/Login/loginScreen.dart';
import 'package:dronaidapp/components/SocialIcon.dart';
import 'Background.dart';
import 'package:flutter/services.dart';
import 'package:dronaidapp/components/RoundInputField.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // bool showImage = true;
  final _formKey = GlobalKey<FormState>();
  // final FocusNode _focus = FocusNode();
  // TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  // TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController bloodcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();

  bool loading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Utils utils = Utils();
  String url=PROD_URL+"/user/registeruser";
  bool obscureText = true;


  // void postdata() async{
  //   var dio= Dio();
  //   var body=jsonEncode({
  //     "email": emailcontroller.text.toString(),
  //     "password": passwordcontroller.text.toString(),
  //     "name":namecontroller.text.toString(),
  //     "phone":phonecontroller.text,
  //   });
  //
  //   try {
  //     Response response = await dio.post(url, data: body);
  //     print(response.data);
  //     if(response.statusCode==200){
  //       Navigator.pushNamed(context, LoginScreen.id);
  //     }
  //
  //   }catch(err){
  //     print(err);
  //   }
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _focus.addListener(_onFocusChange);
  }
  void signup(){
    setState(() {
      loading = true;
    });
    _auth.createUserWithEmailAndPassword(email: emailcontroller.text.toString(), password: passwordcontroller.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      database();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      utils.toastmessage("Account successfully created");
    })
        .onError((error, stackTrace){
      utils.toastmessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  void database(){
    final user = _auth.currentUser!.uid.toString();
    final databaseRef = FirebaseDatabase.instance.ref(user);
    String databasename  = 'Profile Info';
    databaseRef.child(databasename).set({
      'Name' :  namecontroller.text.toString(),
      'Email': emailcontroller.text.toString(),
      'Age': agecontroller.text.toString(),
      'Blood-Group': bloodcontroller.text.toString(),
      'Height': heightcontroller.text.toString(),
      'Weight': weightcontroller.text.toString(),
    }).then((value){
      setState(() {
        loading = false;
      });
      Utils().toastmessage('User Info Added');
    }).onError((error, stackTrace) {
      Utils().toastmessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: size.height * 0.03,
            ),
            SvgPicture.asset(
              'assets/icons/signup.svg',
              height: size.height * 0.35,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: namecontroller,
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_outlined,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Name",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Password can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height*0.002,
                    ),
                    TextFormField(
                      controller: emailcontroller,
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.email_outlined,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Email ID",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Password can\'t be empty';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height*0.002,
                    ),
                    TextFormField(
                        controller: passwordcontroller,
                        obscureText: obscureText,
                        autofocus: true,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.password,
                            color: Color(0xFF6F35A5),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.grey,
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
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Password can\'t be empty';
                          }
                          return null;
                        },
                      ),
                    SizedBox(
                      height: size.height*0.002,
                    ),
                    TextFormField(
                      controller: agecontroller,
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.date_range_sharp,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Age",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Age required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height*0.002,
                    ),
                    TextFormField(
                      controller: bloodcontroller,
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Blood group",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Blood group required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height*0.002,
                    ),
                    TextFormField(
                      controller: weightcontroller,
                      obscureText: obscureText,
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          color: Colors.grey,
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
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Weight needs to be mentioned!';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height*0.002,
                    ),
                    TextFormField(
                      controller: heightcontroller,
                      obscureText: obscureText,
                      autofocus: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.password,
                          color: Color(0xFF6F35A5),
                        ),
                        hintText: "Height",
                        hintStyle: TextStyle(
                          color: Colors.grey,
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
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Height must be there!';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
        child: InkWell(
          onTap: (){
            if(_formKey.currentState!.validate()){
              signup();
            }
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
                'SIGNUP',
                style: TextStyle(
                  color: Colors.white,
                ),),
            ),
          ),
        ),
      ),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return LoginScreen();
                }));
              },
              login: false,
            ),
            // const OrDivider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     SocialIcon(
            //       iconSrc: 'assets/icons/facebook.svg',
            //       onPress: () {},
            //     ),
            //     SocialIcon(iconSrc: 'assets/icons/twitter.svg', onPress: () {}),
            //     SocialIcon(
            //         iconSrc: 'assets/icons/google-plus.svg', onPress: () {}),
            //   ],
            // )
          ],
        ));
  }
  @override
  Widget buildNext(BuildContext context){
    return background(child: SingleChildScrollView());
  }
}
