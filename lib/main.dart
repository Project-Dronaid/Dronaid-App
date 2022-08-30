import 'package:dronaidapp/Screens/Home/profilePageComponents/community.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/faq.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/faq.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/license.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/license.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/medicalService.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/medicalService.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/settings.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/settings.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/signOut.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/signOut.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/support.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/support.dart';
import 'package:dronaidapp/Screens/WelcomeScreen/welcomeBack.dart';
import 'package:flutter/material.dart';
import 'Screens/Home/homeScreen.dart';
import 'Screens/Home/profilePageComponents/personalData.dart';
import 'Screens/Login/loginScreen.dart';
import 'Screens/SignUp/signUp.dart';
import 'constants.dart';

import 'introScreens/splashScreen.dart';
import 'onBoardingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'start',
      routes: {
        'onBoarding': (context) => OnBoardingScreen(),
        WelcomeBack.id: (context) => WelcomeBack(),
        'start': (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignUp.id: (context) => SignUp(),
        'home': (context) => HomeScreen(),
        PersonalData.id: (context) => PersonalData(),
        MedicalServices.id: (context) => MedicalServices(),
        Settings.id: (context) => Settings(),
        SignOut.id: (context) => SignOut(),
        Faq.id: (context) => Faq(),
        Community.id: (context) => Community(),
        License.id: (context) => License(),
        Support.id: (context) => Support(),
      },
    );
  }
}
