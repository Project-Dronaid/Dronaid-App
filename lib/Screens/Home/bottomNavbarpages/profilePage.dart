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
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(29, 56, 73, 1.0),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            }).onError((error, stackTrace) {
              Utils().toastmessage(error.toString());
            });
          }, icon: Icon(Icons.logout_outlined)),
          SizedBox(width: 10,)
        ],
        title: Text('Profile'),
      ),
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
                    // ProfileCardWidgetwithOptions(
                    //   route: PersonalData.id,
                    //   iconData: Icons.person,
                    //   textContext: 'Personal Data',
                    //   iconDataWithArrow: Icons.arrow_right,
                    //   color: const Color(0xFF8689C6),
                    //   onPress: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalData(widget.user_id!)));
                    //   },
                    // ),
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
                    trailing: IconButton(
                      icon: Icon(Icons.keyboard_arrow_right, color: const Color(0xff000162), size: 30,),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalData()));
                      },
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
                          trailing: IconButton(
                            icon: Icon(Icons.keyboard_arrow_right, color: const Color(0xff000162), size: 30,),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalHistory()));
                            },
                          ),
                        ),
                      ),
                    ),
                    // ProfileCardWidgetwithOptions(
                    //   iconData: Icons.medical_services_rounded,
                    //   textContext: 'Medical History',
                    //   iconDataWithArrow: Icons.arrow_right,
                    //   color: const Color(0xFF8689C6),
                    //   onPress: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (context) => MedicalHistory(widget.user_id)));
                    //   },
                    //   route: MedicalHistory.id,
                    // ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.settings,
                      textContext: 'Settings',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        Navigator.pushNamed(context, Settings.id);
                      },
                      route: Settings.id,
                    ),
                    const Divider(),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.message_rounded,
                      textContext: 'FAQ',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        Navigator.pushNamed(context, Faq.id);
                      },
                      route: Faq.id,
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.group_add,
                      textContext: 'Community',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        Navigator.pushNamed(context, Community.id);
                      },
                      route: Community.id,
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.file_copy_rounded,
                      textContext: 'License',
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        Navigator.pushNamed(context, License.id);
                      },
                      route: License.id,
                      iconDataWithArrow: Icons.arrow_right,
                    ),
                    ProfileCardWidgetwithOptions(
                      iconData: Icons.headset_mic_rounded,
                      textContext: 'Feel Free To ask. We are Ready to Help',
                      iconDataWithArrow: Icons.arrow_right,
                      color: const Color(0xFF8689C6),
                      onPress: () {
                        Navigator.pushNamed(context, Support.id);
                      },
                      route: Support.id,
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


