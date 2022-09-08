import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'profilePage.dart';
import 'webPage.dart';
import 'helpMainPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeListView(),
    );
  }
}

class HomeListView extends StatefulWidget {
  const HomeListView({Key? key}) : super(key: key);

  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  int pageIndex = 0;

  final pages = [
    WebPage(),
    HelpPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[pageIndex],
      extendBody: true,
      bottomNavigationBar: buildMyNavBar(context),
    );
  }

  Widget buildMyNavBar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height*0.008),
      child: Container(
        height: size.height*0.1,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(29, 56, 73, 1.0),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20),),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              spreadRadius: 5,
              blurRadius: 7,
              offset:  Offset(0, 7), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: size.height*0.008,bottom: size.height*0.008,left: size.width*0.020,right:size.width*0.020),
          child: GNav(
            color: Color(0xFF8689C6),
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xFF8689C6),
            onTabChange: (index){
              setState(() {
                pageIndex=index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: '         Home      ',
                textStyle: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: TablerIcons.drone,
                text: '         Help      ',
                textStyle: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: Icons.person ,
                text: '         Profile      ',
                textStyle: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              )
            ],),
        ),
      ),
    );

  }
}
