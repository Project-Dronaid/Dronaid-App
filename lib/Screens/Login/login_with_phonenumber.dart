import 'package:dronaidapp/Screens/Login/verify_code.dart';
import 'package:dronaidapp/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  final phoneNumbercontroller = TextEditingController();
  bool loading = false;
  final _auth = FirebaseAuth.instance;
  final String country = '+91';

  void phoneLogin() {
    setState(() {
      loading = true;
    });
    _auth.verifyPhoneNumber(
        phoneNumber: country + phoneNumbercontroller.text.toString(),
        verificationCompleted: (_){
          setState(() {
            loading = false;
          });
        },
        verificationFailed: (e){
          Utils().toastmessage(e.toString());
          setState(() {
            loading = false;
          });
        },
        codeSent: (String verificationID, int? token){
          Navigator.push(context,
              MaterialPageRoute(builder: (context)=>
                  Verifycodescreen(verificationId: verificationID,)));
          setState(() {
            loading = false;
          });
        },
        codeAutoRetrievalTimeout: (e){
          Utils().toastmessage(e.toString());
          setState(() {
            loading = false;
          });
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: Column(
          children: [
            SizedBox(
                height: 80
            ),
            TextFormField(
              controller: phoneNumbercontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: '7903646350'
              ),
            ),
            SizedBox(
                height: 80
            ),
          InkWell(
            onTap: () {phoneLogin();},
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: loading ? CircularProgressIndicator(strokeWidth: 3, color: Colors.white ,) :
                Text(
                  'Send OTP',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),
            ),
          ),

          ],
        ),
      ),
    );
  }
}