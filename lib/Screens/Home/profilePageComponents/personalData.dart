import 'dart:convert';
import 'dart:io';

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
  // String? dropDownValue = "O+ve";
  // var items = [
  //   "O+ve",
  //   "A+ve",
  //   "B+ve",
  //   "AB+ve",
  // ];
  // Future<void> getuserdetail() async {
  //   var url = PROD_URL + "/user/getuser/" + widget.user_id;
  //   var response = await get(Uri.parse(url));
  //   var jsondata = await jsonDecode(response.body);
  //
  //   setState(() {
  //     name = jsondata['user']['name'].toString();
  //     email = jsondata['user']['email'].toString();
  //     phonenumber = jsondata['user']['phonenumber'].toString();
  //     age = jsondata['user']['age'].toString();
  //     gender = jsondata['user']['gender'].toString();
  //     bloodgroup = jsondata['user']['bloodgroup'].toString();
  //     height = jsondata['user']['height'].toString();
  //     weight = jsondata['user']['weight'].toString();
  //
  //   });
  // }
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
    final databaseRef = FirebaseDatabase.instance.ref(auth.currentUser!.uid.toString());
    DatabaseEvent  event = await databaseRef.once();
    var parent = event.snapshot.child('Profile Info');
    setState(() {
      name = parent.child('Name').value.toString();
      email = parent.child('Email').value.toString();
      age = parent.child('Age').value.toString();
      bloodgroup = parent.child('Blood-Group').value.toString();
      height = parent.child('Height').value.toString();
      weight =  parent.child('Weight').value.toString();
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showDetailsUser();
    // getuserdetail();
  }

  @override
  Widget build(BuildContext context) {
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
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: image!=null ? FileImage(image!): AssetImage('assets/images/profilepicture.png') as ImageProvider,
                  // image!= null? Image.file(image!) : Image.asset('assets/images/profilepicture.png'),
                ),
                IconButton(onPressed: () => pickImage(ImageSource.gallery), icon: Icon(Icons.edit)),
                SizedBox(
                  height: 20.0,
                  width: 250.0,
                ),
              ],
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
                    // DataContainer(
                    //   num: 2.5,
                    //   childOfContainer: DropdownButton(
                    //     isExpanded: true,
                    //     underline: const SizedBox(),
                    //     isDense: true,
                    //     icon: const Icon(
                    //       Icons.keyboard_arrow_down,
                    //       color: Color(0xff00078B),
                    //     ),
                    //     value: dropDownValue,
                    //     items: items
                    //         .map((e) => DropdownMenuItem(
                    //               value: e,
                    //               child: Text(
                    //                 e,
                    //                 style: blueTextStyle,
                    //               ),
                    //             ))
                    //         .toList(),
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         dropDownValue = newValue;
                    //       });
                    //     },
                    //   ),
                    // ),
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
                      "Height",
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
                      "Weight",
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
              ],
            ),


            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     DataContainer(
            //       childOfContainer: const Text(
            //         "Other",
            //         style: blueTextStyle,
            //       ),
            //       num: 2.5,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
