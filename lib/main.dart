import 'package:dronaidapp/Screens/Helps/Ambulance.dart';
import 'package:dronaidapp/Screens/Helps/Emergency.dart';
import 'package:dronaidapp/Screens/Helps/Fire.dart';
import 'package:dronaidapp/Screens/Helps/MedicalAid.dart';
import 'package:dronaidapp/Screens/Helps/Police.dart';
import 'package:dronaidapp/Screens/WelcomeScreen/welcomeBack.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Login/loginScreen.dart';
import 'Screens/Shopping/provider/products.dart';
import 'Screens/Shopping/screens/product_detail.dart';
import 'Screens/Shopping/screens/product_overview.dart';
import 'Screens/SignUp/signUp.dart';
import 'introScreens/splashScreen.dart';
import 'onBoarding/onBoardingScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          iconTheme: IconThemeData(
            color: Colors.white,
          )
        ),
        // theme: ThemeData(
        //   primarySwatch: Colors.deepPurple,
        // ),
        initialRoute: SplashScreen.id,
        routes: {
          OnBoardingScreen.id : (context) => OnBoardingScreen(),
          WelcomeBack.id: (context) => WelcomeBack(),
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUp.id: (context) => SignUp(),
          // HomeScreen.id : (context) => HomeScreen(),
          // PersonalData.id: (context) => PersonalData(),
          // MedicalHistory.id: (context) => MedicalHistory(),
          // Settings.id: (context) => Settings(),
          // Faq.id: (context) => Faq(),
          // Community.id: (context) => Community(),
          // License.id: (context) => License(),
          // Support.id: (context) => Support(),
          MedicalAidMarket.id : (context) => MedicalAidMarket(),
          Fire.id:  (context) => Fire(),
          Ambulance.id: (context) => Ambulance(),
          Police.id: (context) => Police(),
          Emergency.id: (context) => Emergency(),
          '/':(context)=> ProductOverviewScreen(),
          '/product_detail':(context)=>ProductDetailScreen( 'This')
        },
      ),
    );
  }
}
