import 'dart:convert';

import 'package:dronaidapp/Screens/Home/profilePageComponents/community.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/faq.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/license.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/medicalHistory.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/personalData.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/settings.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/support.dart';
import 'package:dronaidapp/Screens/Login/loginScreen.dart';
import 'package:dronaidapp/Screens/WelcomeScreen/welcomeBack.dart';
import 'package:dronaidapp/Utils/Utils.dart';
import 'package:dronaidapp/components/url.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:dronaidapp/components/profileCardWidget.dart';
import 'package:http/http.dart';

import '../../../components/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final auth = FirebaseAuth.instance;
  var name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showDetails();
    // getuserdetail();
  }
  Future <void> showDetails() async {
    final databaseRef = FirebaseDatabase.instance.ref("USERS");
    final user = auth.currentUser!.uid.toString();
    DatabaseEvent event = await databaseRef.once();
    var parent = event.snapshot.child(user + '/Profile Info');
    setState(() {
      name = parent.child('Name').value.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color.fromRGBO(29, 56, 73, 1.0),
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   title: Text('Profile'),
      // ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F3FC),
      body: ListView(
        shrinkWrap: false,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,left: 30, right: 30,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          AssetImage('assets/images/profilepicture.png'),
                    ),
                  ],
                ),
                Text(
                  name.toString(),
                  style: kProfileTextStyle,
                ),
                const Divider(),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Hero(
              tag: 'Personal Data',
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalData()));
                },
                child: Card(
                  elevation: 0,
                  color: Colors.transparent,
                  child: ListTile(
                    // dense: true,
                    leading: Container(
                      // width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: const Color(0xff8689C6),
                        ),
                      ),
                      child: Icon(
                        Icons.person,
                        color: Color(0xFF8689C6),
                      ),
                    ),
                    title: Text(
                      'Personal Data',
                      style: kProfileStyle,
                    ),
                  ),
                ),
              ),
            ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalHistory()));
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          // dense: true,
                          leading: Container(
                            // width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: const Color(0xff8689C6),
                              ),
                            ),
                            child: Icon(
                              Icons.medical_services_rounded,
                              color: Color(0xFF8689C6),
                            ),
                          ),
                          title: Text(
                            'Medical History',
                            style: kProfileStyle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalHistory()));
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          // dense: true,
                          leading: Container(
                            // width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: const Color(0xff8689C6),
                              ),
                            ),
                            child: Icon(
                              Icons.list_alt,
                              color: Color(0xFF8689C6),
                            ),
                          ),
                          title: Text(
                            'Order History',
                            style: kProfileStyle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          // dense: true,
                          leading: Container(
                            // width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: const Color(0xff8689C6),
                              ),
                            ),
                            child: Icon(
                              Icons.settings,
                              color: Color(0xFF8689C6),
                            ),
                          ),
                          title: Text(
                            'Settings',
                            style: kProfileStyle,
                          ),
                        ),
                      ),
                    ),
                    const Divider(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Faq()));
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          // dense: true,
                          leading: Container(
                            // width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: const Color(0xff8689C6),
                              ),
                            ),
                            child: Icon(
                              Icons.message_rounded,
                              color: Color(0xFF8689C6),
                            ),
                          ),
                          title: Text(
                            'FAQ',
                            style: kProfileStyle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Community()));
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          // dense: true,
                          leading: Container(
                            // width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: const Color(0xff8689C6),
                              ),
                            ),
                            child: Icon(
                              Icons.group_add,
                              color: Color(0xFF8689C6),
                            ),
                          ),
                          title: Text(
                            'Community',
                            style: kProfileStyle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => License()));
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          // dense: true,
                          leading: Container(
                            // width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: const Color(0xff8689C6),
                              ),
                            ),
                            child: Icon(
                              Icons.file_copy_rounded,
                              color: Color(0xFF8689C6),
                            ),
                          ),
                          title: Text(
                            'License',
                            style: kProfileStyle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Support()));
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          // dense: true,
                          leading: Container(
                            // width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: const Color(0xff8689C6),
                              ),
                            ),
                            child: Icon(
                              Icons.headset_mic_rounded,
                              color: Color(0xFF8689C6),
                            ),
                          ),
                          title: Text(
                            'Feel Free To ask. We are Ready to Help',
                            style: kProfileStyle,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        auth.signOut().then((value){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        }).onError((error, stackTrace) {
                          Utils().toastmessage(error.toString());
                        });
                      },
                      child: Card(
                        elevation: 0,
                        color: Colors.transparent,
                        child: ListTile(
                          // dense: true,
                          leading: Container(
                            // width: double.infinity,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                color: const Color(0xff8689C6),
                              ),
                            ),
                            child: Icon(
                              Icons.logout_outlined,
                              color: Color(0xFF8689C6),
                            ),
                          ),
                          title: Text(
                            'Logout',
                            style: kProfileStyle,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height*0.1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


