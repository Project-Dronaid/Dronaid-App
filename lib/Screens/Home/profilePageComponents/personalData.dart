import 'dart:convert';
import 'dart:io';

import 'package:dronaidapp/Utils/Utils.dart';
import 'package:dronaidapp/components/personalDataContainers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:dronaidapp/components/url.dart';
import 'package:dronaidapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import '../../../components/constants.dart';
import '../../../components/profileCardWidget.dart';

class PersonalData extends StatefulWidget {
  static const String id = "personalData";
  // String gender = "m";
  @override
  State<PersonalData> createState() => _PersonalDataState();
}

class _PersonalDataState extends State<PersonalData> {
  var name;
  var email;
  var phonenumber;
  var age;
  var gender;
  var bloodgroup;
  var height;
  var weight;
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final pImage = await ImagePicker().pickImage(
          source: source);
      if (pImage == null)
        return;
      final imageTemp = File(pImage.path);
      //  final imagePermanent = saveImagePermanently(pImage.path);
      setState(() {
        image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
  }

  Future saveImagePermanently(String imagePath) async{
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  final auth = FirebaseAuth.instance;

  Future<void> showDetailsUser() async {
    final databaseRef = FirebaseDatabase.instance.ref("USERS");
    final user = auth.currentUser!.uid.toString();
    DatabaseEvent  event = await databaseRef.once();
    var parent = event.snapshot.child(user+'/Profile Info');
    setState(() {
      name = parent.child('Name').value.toString();
      email = parent.child('Email').value.toString();
      age = parent.child('Age').value.toString();
      bloodgroup = parent.child('Blood-Group').value.toString();
      height = parent.child('Height').value.toString();
      weight =  parent.child('Weight').value.toString();
      gender = parent.child('Gender').value.toString();
      phonenumber = parent.child('Phone').value.toString();
    });
  }
  final editControllername = TextEditingController();
  final editControllerph = TextEditingController();
  final editControllerage = TextEditingController();
  final editControllerbg = TextEditingController();
  final editControllerg = TextEditingController();
  final editControllerh = TextEditingController();
  final editControllerw = TextEditingController();
  final databaseRef = FirebaseDatabase.instance.ref("USERS");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showDetailsUser();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> showMyDialog() async {
      editControllername.text = name;
      editControllerph.text = phonenumber;
      editControllerage.text = age;
      editControllerbg.text = bloodgroup;
      editControllerg.text = gender;
      editControllerh.text = height;
      editControllerw.text = weight;
      return showDialog(
          context: context,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text('Update',style: blueTextStyle,),
              content: Container(
                width: size.width*0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextField(
                      controller: editControllername,
                      decoration: InputDecoration(
                        hintText: 'Edit',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: editControllerph,
                      decoration: InputDecoration(
                        hintText: 'Edit',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: editControllerage,
                      decoration: InputDecoration(
                        hintText: 'Edit',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: editControllerbg,
                      decoration: InputDecoration(
                        hintText: 'Edit',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: editControllerg,
                      decoration: InputDecoration(
                        hintText: 'Edit',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: editControllerh,
                      decoration: InputDecoration(
                        hintText: 'Edit',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextField(
                      controller: editControllerw,
                      decoration: InputDecoration(
                        hintText: 'Edit',
                        border: OutlineInputBorder(),
                      ),
                    ),

                  ],
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () async {
                      final user = auth.currentUser!.uid.toString();
                      final databaseRef = FirebaseDatabase.instance.ref("USERS/"+user+"/Profile Info");
                      databaseRef.update({
                        'Name' : editControllername.text.toString(),
                        'Phone' : editControllerph.text.toString(),
                        'Age': editControllerage.text.toString(),
                        'Blood-Group': editControllerbg.text.toString(),
                        'Gender': editControllerg.text.toString(),
                        'Height': editControllerh.text.toString(),
                        'Weight': editControllerw.text.toString(),
                      }).then((value) async {
                        final databaseRef1 = FirebaseDatabase.instance.ref("USERS");
                        final user = auth.currentUser!.uid.toString();
                        DatabaseEvent event = await databaseRef1.once();
                        var parent = event.snapshot.child(user+'/Profile Info');
                        setState(() {
                          name = parent.child('Name').value.toString();
                          age = parent.child('Age').value.toString();
                          bloodgroup = parent.child('Blood-Group').value.toString();
                          height = parent.child('Height').value.toString();
                          weight =  parent.child('Weight').value.toString();
                          gender = parent.child('Gender').value.toString();
                          phonenumber = parent.child('Phone').value.toString();
                        });
                        Utils().toastmessage('Updated');
                        Navigator.pop(context);
                      }).onError((error, stackTrace){
                        Utils().toastmessage(error.toString());
                      });
                    }, child: Text('Update')),
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel')),
              ],
            );
          }
      );
    }
    return Hero(
      tag: 'Personal Data',
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.keyboard_arrow_left,
              color: Color(0xff000162),
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFFF2F3FC),
          title: const Text(
            "Personal Data",
            style: TextStyle(
              color: Color(0xff000162),
            ),
          ),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF2F3FC),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          shrinkWrap: true,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: image!=null ? FileImage(image!): AssetImage('assets/images/profilepicture.png') as ImageProvider,
                    // image!= null? Image.file(image!) : Image.asset('assets/images/profilepicture.png'),
                  ),
                  Positioned(
                      bottom: 20,
                      right: 10,
                      child: CircleAvatar(
                        radius: 25,
                        child: IconButton(
                            onPressed: () => pickImage(ImageSource.gallery), icon: Icon(Icons.edit,size: size.height*0.025)),
                      )),

                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.04,
            ),
            const Text(
              "Your Name",
              style: lightBlueTextStyle,
            ),
            DataContainer(
              num: 1,
              childOfContainer: Text(
                name.toString(),
                style: blueTextStyle,
              ),
            ),
            const Text(
              "Email",
              style: lightBlueTextStyle,
            ),
            DataContainer(
              num: 1,
              childOfContainer: Text(
                email.toString(),
                style: blueTextStyle,
              ),
            ),
            const Text(
              "Phone Number",
              style: lightBlueTextStyle,
            ),
            DataContainer(
              num: 1,
              childOfContainer: Text(
                phonenumber.toString(),
                style: blueTextStyle,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Age",
                      style: lightBlueTextStyle,
                    ),
                    DataContainer(
                      num: 2.5,
                      childOfContainer: Text(
                        age.toString(),
                        style: blueTextStyle,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Blood Group",
                      style: lightBlueTextStyle,
                    ),
                    DataContainer(
                      childOfContainer: Text(
                        bloodgroup.toString(),
                        style: blueTextStyle,
                      ),
                      num: 2.5,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Gender",
                      style: lightBlueTextStyle,
                    ),
                    DataContainer(
                      childOfContainer: Text(
                        gender.toString(),
                        style: blueTextStyle,
                      ),
                      num: 2.5,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Height (cm)",
                      style: lightBlueTextStyle,
                    ),
                    DataContainer(
                      childOfContainer: Text(
                        height.toString(),
                        style: blueTextStyle,
                      ),
                      num: 2.5,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Weight (kg)",
                      style: lightBlueTextStyle,
                    ),
                    DataContainer(
                      childOfContainer: Text(
                        weight.toString(),
                        style: blueTextStyle,
                      ),
                      num: 2.5,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      width: MediaQuery.of(context).size.width/3.5,
                      height: MediaQuery.of(context).size.height/13,
                      decoration: BoxDecoration(
                        color: Color(0xff00078B),
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: const Color(0xff8689C6),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 1,
                        vertical: 1,
                      ),
                        child: TextButton(
                            onPressed: (){
                          showMyDialog();
                        }, child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(Icons.edit,color: Colors.white,),
                            Text('EDIT',style: TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.height*0.023)),
                          ],
                        ),),
                    ),
                  ],
                )
                // Container(
                //   margin: const EdgeInsets.symmetric(vertical: 8),
                //   width: MediaQuery.of(context).size.width/2.5,
                //   decoration: BoxDecoration(
                //     borderRadius: const BorderRadius.all(Radius.circular(10)),
                //     border: Border.all(
                //       color: const Color(0xff8689C6),
                //     ),
                //   ),
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 21,
                //     vertical: 16,
                //   ),
                //   child: TextButton(
                //       onPressed: (){
                //     showMyDialog();
                //   }, child: Text('Edit info!',style: TextStyle(
                //     color: Color(0xff000162),
                //   ),)),
                // )

              ],
            ),
          ],
        ),
      ),
    );

  }

}
