import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_dronaid/Screens/Login/loginScreen.dart';
import 'package:project_dronaid/Screens/SignUp/Background.dart';
import 'package:project_dronaid/components/AlreadyHaveAnAccountCheck.dart';
import 'package:project_dronaid/components/OrDivider.dart';
import 'package:project_dronaid/components/RoundInputField.dart';
import 'package:project_dronaid/components/SocialIcon.dart';
import 'package:project_dronaid/components/roundedButton.dart';
import 'package:project_dronaid/components/roundedPasswordField.dart';
import 'package:project_dronaid/constants.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return background(
        child: SingleChildScrollView(
          child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          const Text('SIGNUP',
          style: TextStyle(fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: size.height*0.03,),
          SvgPicture.asset('assets/icons/signup.svg',
          height: size.height*0.35,),
          SizedBox(height: size.height*0.03,),
          RoundedInputField(hintText: 'Phone Number', icon: Icons.phone, onChanged: (value){}, maxLength: 10),
          RoundedPasswordField(onChanged: (value){}),
          RoundedButton(text: 'SIGNUP', color: kPrimaryColor, textColor: Colors.white, route: 'home'),
          SizedBox(height: size.height*0.03,),
          AlreadyHaveAnAccountCheck(press: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return const LoginScreen();
            }));
          }, login: false,),
           const OrDivider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               SocialIcon(
                 iconSrc: 'assets/icons/facebook.svg', onPress: (){},
               ),
              SocialIcon(iconSrc: 'assets/icons/twitter.svg', onPress: (){}),
              SocialIcon(iconSrc: 'assets/icons/google-plus.svg', onPress: (){}),
            ],
          )
      ],
    ),
        ));
  }
}



