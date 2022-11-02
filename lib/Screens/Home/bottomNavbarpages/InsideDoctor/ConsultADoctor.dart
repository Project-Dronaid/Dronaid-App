import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ConsultaDoctor extends StatefulWidget {
  const ConsultaDoctor({Key? key}) : super(key: key);

  @override
  State<ConsultaDoctor> createState() => _ConsultaDoctorState();
}

class _ConsultaDoctorState extends State<ConsultaDoctor> {
  var databaseRef1 = FirebaseDatabase.instance.ref('DOCTOR/SPECIALITIES');
  var databaseRef2 = FirebaseDatabase.instance.ref('DOCTOR/CONSULTED');
  var databaseRef3 = FirebaseDatabase.instance.ref('DOCTOR/SYMPTOMS');
  var databaseRef4 = FirebaseDatabase.instance.ref('DOCTOR/HEALTHISSUES');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Consult a Doctor'),
        actions: [
          TextButton(onPressed: (){}, child: Text('HELP',style: TextStyle(color: Colors.white),))
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height*0.025),
              child: SizedBox(
                height: size.height*0.12,
                child: ListView(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.025),
                      child: Container(
                        width: size.width*0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: size.width*0.05,top: size.height*0.01,bottom: size.height*0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Text('Say Hello Doctor',style: TextStyle(color: Colors.white,fontSize: size.height*0.015,fontWeight: FontWeight.bold),),
                                    // Text('Get upto',style: TextStyle(color: Colors.white,fontSize: size.height*0.018,fontWeight: FontWeight.w400),),
                                    Row(
                                      children: [
                                        Icon(Icons.verified,color: Color(0xFF000161),),
                                        Expanded(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Verified Doctors',style: TextStyle(color: Color(0xFF000161),fontSize: size.height*0.015,fontWeight: FontWeight.bold),),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(Icons.lock,color: Color(0xFF000161),),
                                        Expanded(child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text('Connect in 60 seconds and talk privately',style: TextStyle(color: Color(0xFF000161),fontSize: size.height*0.015,fontWeight: FontWeight.w400),),
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Image.asset('assets/images/FirstDocOnline.png'))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.025),
                      child: Container(
                        width: size.width*0.85,
                        decoration: BoxDecoration(
                          color: Color(0xFF8689C6),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: size.width*0.03,top: size.height*0.01,bottom: size.height*0.02),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Free Follow-up',style: TextStyle(color: Colors.white,fontSize: size.height*0.022,fontWeight: FontWeight.bold),),
                                    Expanded(child: Text('for 7 days with every consultation',style: TextStyle(color: Colors.white,fontSize: size.height*0.014,fontWeight: FontWeight.w400),)),
                                    Container(
                                      height: size.height*0.035,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: (){},
                                        child: Text('KNOW MORE',),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.025),
                      child: Container(
                        width: size.width*0.85,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: size.width*0.01,top: size.height*0.01,bottom: size.height*0.01),
                              child: Text('How video consultation works ?',style: TextStyle(color: Colors.black,fontSize: size.height*0.015,fontWeight: FontWeight.bold),),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          radius: 20.0,
                                          backgroundImage: AssetImage('assets/images/online-medical-consultation-concept-with-doctor-mobile-phone-screen-online-medical-services-app-remote-consultations-appointment-cartoon-vector-illustration-isolated-white-background_605858-501.jpg')),
                                      Text('Select a Scpeciality',style: TextStyle(fontSize: size.height*0.015),)
                                    ],
                                  ),
                                ),
                                Center(child: Icon(Icons.keyboard_arrow_right,color: Colors.grey,)),
                                Expanded(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          radius: 20.0,
                                          backgroundImage: AssetImage('assets/images/online-medical-consultation-concept-with-doctor-mobile-phone-screen-online-medical-services-app-remote-consultations-appointment-cartoon-vector-illustration-isolated-white-background_605858-501.jpg')),
                                      Text('Complete Payement')
                                    ],
                                  ),
                                ),
                                Center(child: Icon(Icons.keyboard_arrow_right,color: Colors.grey,)),
                                Expanded(
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                          radius: 20.0,
                                          backgroundImage: AssetImage('assets/images/online-medical-consultation-concept-with-doctor-mobile-phone-screen-online-medical-services-app-remote-consultations-appointment-cartoon-vector-illustration-isolated-white-background_605858-501.jpg')),
                                      Text('Start your consultation')
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.025),
                      child: Container(
                        width: size.width*0.85,
                        decoration: BoxDecoration(
                          color: Color(0xFF8689C6),
                          borderRadius: BorderRadius.all(
                              Radius.circular(10.0)
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: EdgeInsets.only(left: size.width*0.05,top: size.height*0.01,bottom: size.height*0.01),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Say Hello Doctor',style: TextStyle(color: Colors.white,fontSize: size.height*0.015,fontWeight: FontWeight.bold),),
                                    Text('Get upto',style: TextStyle(color: Colors.white,fontSize: size.height*0.018,fontWeight: FontWeight.w400),),
                                    Row(
                                      children: [
                                        Expanded(child: Text('30% OFF',style: TextStyle(color: Color(0xFF000161),fontSize: size.height*0.015,fontWeight: FontWeight.bold),)),
                                        Text('on video consultation',style: TextStyle(color: Colors.white,fontSize: size.height*0.015,fontWeight: FontWeight.bold),),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Image.asset('assets/images/FirstDocOnline.png'))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Text('Search Health Problems / Symptoms',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.height*0.02
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.025),
              child: Container(
                height: size.height*0.06,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF8689C6).withOpacity(0.2),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: size.width*0.03,
                        ),
                        Text('Eg. Cold, cough, fever'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Consult with Previous Doctor',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.height*0.022
                  ),),
                  Text('Recent Doctors you have consulted with',style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: size.height*0.015
                  ),),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: StreamBuilder(
                  stream: databaseRef2.onValue,
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
                  {
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator(strokeWidth: 1.0));
                    }
                    else{
                      try{
                        Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
                        List<dynamic> list = [];
                        list = map.values.toList();
                        return SizedBox(
                          height: size.height*0.12,
                          child: ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.snapshot.children.length,
                              itemBuilder: (context, index){
                                return Padding(
                                  padding: EdgeInsets.symmetric(horizontal: size.width*0.01,vertical: size.height*0.01),
                                  child: Container(
                                    width: size.width*0.9,
                                    decoration: BoxDecoration(
                                      border:  Border.all(color: Colors.black12),
                                      color: Colors.white,
                                    ),
                                    child: TextButton(
                                      onPressed: () {},
                                      child: ListTile(
                                        leading: CircleAvatar(backgroundImage: NetworkImage(list[index]['Image']),),
                                        title: Text(list[index]['Name'].toString(),style: TextStyle(color: Color(0xFF000161),),),
                                        subtitle: Text(list[index]['Speciality'].toString(),style: TextStyle(color: Color(0xFF000161),)),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        );
                      }
                      catch(e){
                        return Text('Currently you don\'t have any Orders.',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),);
                      }
                    }
                  }
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Text('Choose from top specialities',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.height*0.025
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.005,vertical: size.height*0.02),
              child: StreamBuilder(
                stream: databaseRef1.onValue,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list = map.values.toList();
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.snapshot.children.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: size.height*0.18),
                      itemBuilder: (context,index)
                      {
                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator(strokeWidth: 1.0));
                        }
                        else{
                          try{
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.025),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: size.height*0.03),
                                    child: CircleAvatar(
                                      radius: 40.0,
                                      backgroundColor: Color(0xFF8689C6).withOpacity(0.2),
                                      backgroundImage: NetworkImage(list[index]['Img'].toString()),
                                    ),
                                  ),
                                  Expanded(child: Text(list[index]['Text'],style: TextStyle(fontWeight: FontWeight.w500,fontSize: size.height*0.014),)),
                                ],
                              ),
                            );
                          }
                          catch(e){
                            return CircularProgressIndicator();
                          }
                        }

                      });
                },

              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Text('Common Health Issues',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.height*0.025
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.005,vertical: size.height*0.02),
              child: StreamBuilder(
                stream: databaseRef4.onValue,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list = map.values.toList();
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.snapshot.children.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: size.height*0.18),
                      itemBuilder: (context,index)
                      {
                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator(strokeWidth: 1.0));
                        }
                        else{
                          try{
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.025),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: size.height*0.03),
                                    child: CircleAvatar(
                                      radius: 40.0,
                                      backgroundColor: Color(0xFF8689C6).withOpacity(0.2),
                                      backgroundImage: NetworkImage(list[index]['Img'].toString()),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(list[index]['Text'],style: TextStyle(fontWeight: FontWeight.w500,fontSize: size.height*0.014),)),
                                ],
                              ),
                            );
                          }
                          catch(e){
                            return CircularProgressIndicator();
                          }
                        }

                      });
                },

              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.05),
              child: Text('Symptoms relevant to you',style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.height*0.025
              ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width*0.005,vertical: size.height*0.02),
              child: StreamBuilder(
                stream: databaseRef3.onValue,
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  Map<dynamic,dynamic> map = snapshot.data!.snapshot.value as dynamic;
                  List<dynamic> list = [];
                  list = map.values.toList();
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.snapshot.children.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: size.height*0.165),
                      itemBuilder: (context,index)
                      {
                        if(!snapshot.hasData){
                          return Center(child: CircularProgressIndicator(strokeWidth: 1.0));
                        }
                        else{
                          try{
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: size.width*0.025),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: size.height*0.03),
                                    child: CircleAvatar(
                                      radius: 40.0,
                                      backgroundColor: Color(0xFF8689C6).withOpacity(0.2),
                                      backgroundImage: NetworkImage(list[index]['Img'].toString()),
                                    ),
                                  ),
                                  Expanded(
                                      child: Text(list[index]['Text'],style: TextStyle(fontWeight: FontWeight.w500,fontSize: size.height*0.014),)),
                                ],
                              ),
                            );
                          }
                          catch(e){
                            return CircularProgressIndicator();
                          }
                        }

                      });
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
