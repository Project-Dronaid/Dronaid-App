import 'package:dronaidapp/Screens/Home/homeScreen.dart';
import 'package:dronaidapp/Utils/Utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class Verifycodescreen extends StatefulWidget {
  final String verificationId;
  const Verifycodescreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<Verifycodescreen> createState() => _VerifycodescreenState();
}

class _VerifycodescreenState extends State<Verifycodescreen> {


  final Otpcontroller = TextEditingController();
  bool loading = false;
  final _auth = FirebaseAuth.instance;

  void database(){
    final String db = "USERS";
    final databaseRef = FirebaseDatabase.instance.ref(db);
    final user = _auth.currentUser!.uid.toString();
    String databasename  = 'Profile Info';
    databaseRef.child(user+'/'+databasename).set({
      // 'Name' :  namecontroller.text.toString(),
      // 'Email':  emailcontroller.text.toString(),
      // 'Age':    agecontroller.text.toString(),
      // 'Blood-Group': bloodcontroller.text.toString(),
      // 'Height': heightcontroller.text.toString(),
      // 'Weight': weightcontroller.text.toString(),
    }).then((value){
      setState(() {
        loading = false;
      });
      Utils().toastmessage('User Info Added');
    }).onError((error, stackTrace) {
      Utils().toastmessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: Column(
          children: [
            SizedBox(
                height: 80
            ),
            TextFormField(
              controller: Otpcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: '6 digit code'
              ),
            ),
            SizedBox(
                height: 80
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  loading = true;
                });
                final credential = PhoneAuthProvider.credential(
                    verificationId: widget.verificationId,
                    smsCode: Otpcontroller.text.toString());
                try{
                  await _auth.signInWithCredential(credential);
                  database();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                      setState(() {
                    loading = false;
                  });
                }catch(e){
                Utils().toastmessage(e.toString());
                setState(() {
                loading = false;
                });
                }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: loading ? CircularProgressIndicator(strokeWidth: 3, color: Colors.white ,) :
                  Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


