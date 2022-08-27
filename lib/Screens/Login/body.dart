import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dronaidapp/components/AlreadyHaveAnAccountCheck.dart';
import 'package:dronaidapp/components/RoundInputField.dart';
import 'package:dronaidapp/components/roundedButton.dart';
import 'package:dronaidapp/components/roundedPasswordField.dart';
import 'package:dronaidapp/constants.dart';
import 'package:dronaidapp/Screens/SignUp/signUp.dart';
import 'package:dronaidapp/Screens/WelcomeScreen/background.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('LOGIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: size.height*0.03,),
          SvgPicture.asset('assets/icons/login.svg',
          height: size.height*0.35,),
          SizedBox(height: size.height*0.03,),
          RoundedInputField(hintText: 'Phone Number', icon: Icons.phone, onChanged: (value){}, maxLength: 10),
          RoundedPasswordField(onChanged:(value){

          },),
          RoundedButton(text: 'LOGIN', color: kPrimaryColor, textColor: Colors.white, route: 'home'),
          SizedBox(height: size.height*0.03,),
          AlreadyHaveAnAccountCheck(
            press: (){
              Navigator.pushNamed(context, SignUp.id);
          },)
        ],
    ),
      ),);
  }
}









