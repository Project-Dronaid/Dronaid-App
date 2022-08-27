import 'package:dronaidapp/Screens/Login/loginScreen.dart';
import 'package:dronaidapp/Screens/SignUp/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../components/roundedButton.dart';
import '../../constants.dart';
import '../Login/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(child:
    SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text('WELCOME TO DRONAID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: size.height*0.04,),
          SvgPicture.asset('assets/icons/chat.svg',
          height: size.height*0.45,),
          SizedBox(height: size.height*0.05,),
          RoundedButton(
            text: 'LOGIN',
            textColor: Colors.white,
            route: LoginScreen.id,
            color: kPrimaryColor,
          ),
          RoundedButton(
            route: SignUp.id,
            text: 'SIGN UP',
            textColor: Colors.black,
            color: kPrimaryLightColor,
          ),
        ],
      ),
    ),);
  }
}



