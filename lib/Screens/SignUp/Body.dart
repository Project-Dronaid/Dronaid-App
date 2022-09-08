import 'package:dronaidapp/components/personalDataContainers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dronaidapp/components/AlreadyHaveAnAccountCheck.dart';
import 'package:dronaidapp/components/roundedButton.dart';
import 'package:dronaidapp/components/roundedPasswordField.dart';
import 'package:dronaidapp/constants.dart';
import 'package:dronaidapp/components/OrDivider.dart';
import 'package:dronaidapp/Screens/Login/loginScreen.dart';
import 'package:dronaidapp/components/SocialIcon.dart';
import 'Background.dart';
import 'package:flutter/services.dart';
import 'package:dronaidapp/components/RoundInputField.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // bool showImage = true;

  // final FocusNode _focus = FocusNode();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _focus.addListener(_onFocusChange);
  }

  // void _onFocusChange() {
  //   setState(() {
  //     showImage = !_focus.hasFocus;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // var idk = MediaQuery.of(context).viewInsets.bottom;
    Size size = MediaQuery.of(context).size;
    return background(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.03,
          ),
          SvgPicture.asset(
            'assets/icons/signup.svg',
            height: size.height * 0.35,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          RoundedInputField(
            chld: TextField(
              // focusNode: _focus,
              controller: namecontroller,
              keyboardType: TextInputType.name,
              autofocus: true,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                  // color: Color(0xFF6F35A5),
                ),
                hintText: "Enter Name",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          // RoundedInputField(
          //   cntroller: phonecontroller,
          //     hintText: 'Phone Number',
          //     icon: Icons.phone,
          //     onChanged: (value) {
          //     },
          //     maxLength: 10),
          // RoundedPasswordField(onChanged: (value) {}),
          RoundedInputField(
            chld: TextField(
              controller: phonecontroller,
              keyboardType: TextInputType.phone,
              autofocus: true,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.phone,
                  color: Color(0xFF6F35A5),
                ),
                hintText: "Enter Phone Number",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          RoundedInputField(
            chld: TextField(
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              autofocus: true,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.mail_outline_outlined,
                  color: Color(0xFF6F35A5),
                ),
                hintText: "Enter Email ID",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          RoundedInputField(
            chld: TextField(
              controller: passwordcontroller,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              autofocus: true,
              decoration: const InputDecoration(
                icon: Icon(
                  Icons.password,
                  color: Color(0xFF6F35A5),
                ),
                hintText: "Enter Password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          RoundedButton(
            text: 'SIGNUP',
            color: kPrimaryColor,
            textColor: Colors.white,
            route: 'home',
          ),
          // SizedBox(
          //   height: size.height * 0.03,
          // ),
          // AlreadyHaveAnAccountCheck(
          //   press: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) {
          //       return LoginScreen();
          //     }));
          //   },
          //   login: false,
          // ),
          // const OrDivider(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     SocialIcon(
          //       iconSrc: 'assets/icons/facebook.svg',
          //       onPress: () {},
          //     ),
          //     SocialIcon(iconSrc: 'assets/icons/twitter.svg', onPress: () {}),
          //     SocialIcon(
          //         iconSrc: 'assets/icons/google-plus.svg', onPress: () {}),
          //   ],
          // )
        ],
      ),
    ));
  }
}
