import 'dart:convert';

import 'package:dronaidapp/components/url.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class MedicalHistory extends StatefulWidget {
  static const String id = "medicalServices";

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
  var name;
  var email;
  var phonenumber;
  var age;
  var gender;
  var bloodgroup;
  var height;
  var weight;
  var place;

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
  //   });
  // }

  loadData(){
    _determinePosition().then((value) async {
      List<Placemark> placemarks = await placemarkFromCoordinates(value.latitude, value.longitude);
      place  = placemarks.reversed.last.name.toString() + ", " + placemarks.reversed.last.locality.toString();
      setState(() {
      });
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getuserdetail();
    loadData();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xff000162),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFF2F3FC),
        title: Text(
          "Medical History",
          style: TextStyle(
            color: Color(0xff000162),
          ),
        ),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F3FC),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
          Column(
            children: [
              Text(name.toString(),style: TextStyle(color: Colors.black,fontSize: 25.0),),
              Text(place.toString(),style: TextStyle(color: Colors.black,fontSize: 15.0),),
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/profilepicture.png'),
            radius: 35,
          ),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.calendar_today),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    Text(age.toString(),style: TextStyle(color: Colors.black,fontSize: 18.0),),
                    Text('Age',style: TextStyle(color: Colors.black,fontSize: 15.0),),
                  ],
                ),
                SizedBox(
                  width: 63.0,
                ),
                Icon(Icons.water_drop),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    Text(bloodgroup.toString(),style: TextStyle(color: Colors.black,fontSize: 18.0),),
                    Text('Blood',style: TextStyle(color: Colors.black,fontSize: 15.0)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.height),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    Text(height.toString(),style: TextStyle(color: Colors.black,fontSize: 18.0)),
                    Text('Height',style: TextStyle(color: Colors.black,fontSize: 15.0)),
                  ],
                ),
                SizedBox(
                  width: 35.0,
                ),
                Icon(Icons.monitor_weight_outlined),
                SizedBox(
                  width: 5.0,
                ),
                Column(
                  children: [
                    Text(weight.toString(),style: TextStyle(color: Colors.black,fontSize: 18.0)),
                    Text('Weight',style: TextStyle(color: Colors.black,fontSize: 15.0)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(
                children: [
                  Text('Health Curve',style: TextStyle(color: Colors.black,fontSize: 22.0)),
                  Text('Overall Condition',style: TextStyle(color: Colors.black,fontSize: 12.0)),
                ],
              ),
                PopupMenuButton(
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        onTap: (){

                        },
                        leading: Icon(Icons.edit),
                        title: Text('Edit'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        onTap: (){
                        },
                        leading: Icon(Icons.delete),
                        title: Text('Delete'),
                      ),
                    ),
                  ],
                ),

            ],),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            width: size.width*0.55,
            height: size.height*0.2,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.calendar_today),
                    Text('21 Nov 2017'),
                  ],
                ),
                Column(
                  children: [
                    Text('Osteoporosis'),
                    Text('Ongoing treatment'),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
