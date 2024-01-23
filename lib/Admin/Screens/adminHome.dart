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
import 'package:google_nav_bar/google_nav_bar.dart';

class adminHome extends StatefulWidget {
  const adminHome({super.key});
  static const String id= 'adminHome';
  @override
  State<adminHome> createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  int pageIndex = 0;
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override

  final pages = [

  ];
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[pageIndex],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: pageIndex,
        selectedItemColor: Color(0xFF000161),
        unselectedItemColor: Color(0xFF8689C6),
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag), label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emergency), label: "Emergency",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_information), label: "Doctor",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box), label: "Account",
          ),
        ],
      ),
    );
  }
  Widget buildMyNavBar(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.008),
      child: Container(
        height: size.height * 0.1,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(29, 56, 73, 1.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: size.height * 0.008,
              bottom: size.height * 0.008,
              left: size.width * 0.020,
              right: size.width * 0.020),
          child: GNav(
            color: Color(0xFF8689C6),
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xFF8689C6),
            onTabChange: (index) {
              setState(() {
                if (index == 1) {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ProductOverviewScreen()));
                }
                else {
                  pageIndex = index;
                }
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                iconSize: 20.0,
                // text: ' Home ',
                // textStyle: TextStyle(
                //   fontSize: 20.0,
                //   color: Colors.white,
                // ),
              ),
              GButton(
                icon: TablerIcons.drone,
                iconSize: 20.0,
                text: ' Help ',
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: Icons.person,
                iconSize: 20.0,
                text: ' Profile ',
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: Icons.person,
                iconSize: 20.0,
                text: ' Profile ',
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: Icons.person,
                iconSize: 20.0,
                text: '  Profile ',
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              )
            ],),
        ),
      ),
    );
  }

}
