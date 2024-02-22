import 'package:dronaidapp/Admin/Screens/adminHome.dart';
import 'package:dronaidapp/Screens/Helps/Ambulance.dart';
import 'package:dronaidapp/Screens/Helps/Emergency.dart';
import 'package:dronaidapp/Screens/Helps/Fire.dart';
import 'package:dronaidapp/Screens/Helps/MedicalAid.dart';
import 'package:dronaidapp/Screens/Helps/Police.dart';
import 'package:dronaidapp/Screens/Home/bottomNavbarpages/helpMainPage.dart';
import 'package:dronaidapp/Screens/Login/adminBody.dart';
import 'package:dronaidapp/Screens/Login/adminLogin.dart';
import 'package:dronaidapp/Screens/Products/ProductPage.dart';
import 'package:dronaidapp/Screens/Shopping/screens/cart_screen.dart';
import 'package:dronaidapp/Screens/Shopping/screens/confirmDetails.dart';
import 'package:dronaidapp/Screens/WelcomeScreen/welcomeBack.dart';
import 'package:dronaidapp/Screens/tracking.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'Screens/Login/loginScreen.dart';
import 'Screens/Shopping/provider/cart.dart';
import 'Screens/Shopping/provider/products.dart';
import 'Screens/Shopping/screens/product_detail.dart';
import 'Screens/Shopping/screens/product_overview.dart';
import 'Screens/SignUp/signUp.dart';
import 'introScreens/splashScreen.dart';
import 'onBoarding/onBoardingScreen.dart';
import 'Screens/Login/adminBody.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.indigo,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF8689C6),
            ),
            iconTheme: const IconThemeData(
              color: Colors.white,
            )),
        // theme: ThemeData(
        //   primarySwatch: Colors.deepPurple,
        // ),
        // initialRoute: Tracking.routeName,
        initialRoute: SplashScreen.id,
        routes: {
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          WelcomeBack.id: (context) => WelcomeBack(),
          SplashScreen.id: (context) => SplashScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          SignUp.id: (context) => SignUp(),
          adminBody.id: (context) => adminBody(),
          adminLogin.id: (context) => adminLogin(),
          adminHome.id: (context) => adminHome(),

          // HomeScreen.id : (context) => HomeScreen(),
          // PersonalData.id: (context) => PersonalData(),
          // MedicalHistory.id: (context) => MedicalHistory(),
          // Settings.id: (context) => Settings(),
          // Faq.id: (context) => Faq(),
          // Community.id: (context) => Community(),
          // License.id: (context) => License(),
          // Support.id: (context) => Support(),
          MedicalAidMarket.id: (context) => MedicalAidMarket(),
          Fire.id: (context) => Fire(),
          Ambulance.id: (context) => Ambulance(),
          Police.id: (context) => Police(),
          Emergency.id: (context) => Emergency(),
          '/': (context) => ProductOverviewScreen(),
          '/product_detail': (context) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          ProductPage.routeName: (context) => ProductPage(),
          Tracking.routeName: (context) => Tracking(),
          ConfirmDetails.routeName: (context) => ConfirmDetails(),
        },
      ),
    );
  }
}
