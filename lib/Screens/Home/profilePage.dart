import 'package:dronaidapp/Screens/Home/profilePageComponents/community.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/faq.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/license.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/medicalHistory.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/personalData.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/settings.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/signOut.dart';
import 'package:dronaidapp/Screens/Home/profilePageComponents/support.dart';
import 'package:flutter/material.dart';
import 'package:dronaidapp/components/profileCardWidget.dart';

import '../../components/constants.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF2F3FC),
        body: ListView(
          shrinkWrap: true,
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
                  const Text(
                    'Prathmesh Sinha',
                    style: kProfileTextStyle,
                  ),
                  // const SizedBox(
                  //   height: 20.0,
                  //   width: 250.0,
                  // ),
                  const Divider(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileCardWidgetwithOptions(
                        route: PersonalData.id,
                        iconData: Icons.person,
                        textContext: 'Personal Data',
                        iconDataWithArrow: Icons.arrow_right,
                        color: const Color(0xFF8689C6),
                        onPress: () {
                          Navigator.pushNamed(context, PersonalData.id);
                        },
                      ),
                      ProfileCardWidgetwithOptions(
                        iconData: Icons.medical_services_rounded,
                        textContext: 'Medical History',
                        iconDataWithArrow: Icons.arrow_right,
                        color: const Color(0xFF8689C6),
                        onPress: () {
                          Navigator.pushNamed(context, MedicalHistory.id);
                        },
                        route: MedicalHistory.id,
                      ),
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
                      ProfileCardWidgetwithOptions(
                        iconData: Icons.exit_to_app_rounded,
                        textContext: 'Sign Out',
                        iconDataWithArrow: Icons.arrow_right,
                        color: const Color(0xFF8689C6),
                        onPress: () {
                          Navigator.pushNamed(context, SignOut.id);
                        },
                        route: Settings.id,
                      ),
                      // const SizedBox(
                      //   height: 20.0,
                      //   width: 250.0,
                      // ),
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
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


