import 'package:dronaidapp/Screens/Home/bottomNavbarpages/homemain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import '../Shopping/shoppingMain.dart';
import 'bottomNavbarpages/profilePage.dart';
import 'webPage.dart';
import 'bottomNavbarpages/helpMainPage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "HomeScreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: HomeListView(),
    );
  }
}

class HomeListView extends StatefulWidget {
  @override
  State<HomeListView> createState() => _HomeListViewState();
}

class _HomeListViewState extends State<HomeListView> {
  int pageIndex = 0;
  // var idVal = widget.user_id!;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeMain(),
      shoppingMain(),
      ProfilePage(),
      ProfilePage(),
      ProfilePage(),
    ];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[pageIndex],
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.home), onPressed: () {
              setState((){pageIndex=0;});

            },),
            IconButton(icon: Icon(Icons.shopping_bag), onPressed: () {setState((){pageIndex=1;});},),
            IconButton(icon: Icon(Icons.energy_savings_leaf_outlined), onPressed: () {},),
            IconButton(icon: Icon(Icons.medical_information), onPressed: () {},),
            IconButton(icon: Icon(Icons.account_box), onPressed: () {setState((){pageIndex=2;});},),
          ],
        ),
      ),
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
                if(index==1){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> shoppingMain()));
                }
                else{
                  pageIndex=index;
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
                icon: Icons.person ,
                iconSize: 20.0,
                text: ' Profile ',
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: Icons.person ,
                iconSize: 20.0,
                text: ' Profile ',
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              GButton(
                icon: Icons.person ,
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
