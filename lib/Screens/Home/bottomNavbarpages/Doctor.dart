import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';


class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  State<Doctor> createState() => _DoctorState();
}


class _DoctorState extends State<Doctor> {

  var databaseRef1 = FirebaseDatabase.instance.ref('DOCTOR/SPECIALISTS');
  // final databaseRefDoc = FirebaseDatabase.instance.ref('DOCTOR/CONSULTED');
  var databaseRef2 = FirebaseDatabase.instance.ref('DOCTOR/CONSULTED');
  var databaseRef3 = FirebaseDatabase.instance.ref('DOCTOR/FEATURED');


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.02),
                child: Container(
                    height: size.height*0.06,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
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
                          AnimatedTextKit(animatedTexts: [
                            RotateAnimatedText('Search for doctors',duration: Duration(milliseconds: 1500)),
                            RotateAnimatedText('Search for clinics and hospitals',duration: Duration(milliseconds: 1500)),
                            RotateAnimatedText('Search for medicines and tests',duration: Duration(milliseconds: 1500)),
                            RotateAnimatedText('Search for Symptoms/Specialities',duration: Duration(milliseconds: 1500)),
                          ],repeatForever: true),
                          // Text('Search for doctors'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: size.height*0.25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(
                                    1.0,
                                    1.0,
                                  ),
                                  color: Color(0xFF000161).withOpacity(0.2),
                                  blurRadius: 4.0,
                                  spreadRadius: 0.5,
                                ), //BoxShadow
                                BoxShadow(
                                  color: Colors.white,
                                  offset: const Offset(0.0, 0.0),
                                  blurRadius: 0.0,
                                  spreadRadius: 0.0,
                                ), //BoxShadow
                              ],
                            ),
                            child: Column(
                            children: [
                              Image(
                                image: AssetImage('assets/images/Online-Doctor-Consultation.jpeg'),
                                fit: BoxFit.fill,
                                height: size.height*0.16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: size.height*0.0055,horizontal: size.width*0.03),
                                    child: Text('Instant Video Consult',
                                      style: TextStyle(
                                          fontSize: size.height*0.016,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: size.height*0.001,horizontal: size.width*0.03),
                                    child: Text('Connect within 60 secs',style: TextStyle(
                                        fontSize: size.height*0.013,
                                        fontWeight: FontWeight.w200),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          ),
                        ),
                        SizedBox(
                          width: size.width*0.05,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: size.height*0.01),
                            child: Container(
                              height: size.height*0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(
                                      1.0,
                                      1.0,
                                    ),
                                    color: Color(0xFF000161).withOpacity(0.2),
                                    blurRadius: 4.0,
                                    spreadRadius: 0.5,
                                  ), //BoxShadow
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ), //BoxShadow
                                ],
                              ),
                              child: Column(
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/OrderMedicine.png'),
                                    fit: BoxFit.fill,
                                    height: size.height*0.16,
                                    width: size.width*0.6,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: size.height*0.0055,horizontal: size.width*0.03),
                                        child: Text('Medicines',
                                          style: TextStyle(
                                              fontSize: size.height*0.016,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: size.height*0.001,horizontal: size.width*0.03),
                                        child: Text('Essentials at your door steps',style: TextStyle(
                                            fontSize: size.height*0.016,
                                            fontWeight: FontWeight.w200),),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.001,vertical: size.height*0.02),
                      child: Row(children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(Icons.person,color: Color(0xFF000161).withOpacity(0.7),),
                        ),
                        Text('Doctors you have Consulted with',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height*0.02
                        ),),

                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
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
                            return ListView.builder(
                              shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
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
                                });
                          }
                          catch(e){
                            return Text('Currently you don\'t have any Orders.',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),);
                          }
                        }
                      }
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height*0.01,),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.08),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            child: Icon(Icons.star,color: Color(0xFF000161).withOpacity(0.7),),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                            child: Text('Featured Services',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height*0.022,
                            ),),
                          ),
                        ],),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: StreamBuilder(
                        stream: databaseRef3.onValue,
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
                                height: size.height*0.3,
                                child: ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data!.snapshot.children.length,
                                    itemBuilder: (context, index){
                                      return Padding(
                                        padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.01),
                                        child: Container(
                                          clipBehavior: Clip.antiAlias,
                                          width: size.width*0.5,
                                          decoration: BoxDecoration(
                                            border:  Border.all(color: Colors.black12,),
                                            borderRadius: BorderRadius.circular(25),
                                            color: Colors.white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(horizontal: size.width*0.025,vertical: size.height*0.01),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children:[
                                                Expanded(
                                                  flex: 1,
                                                    child: Row(
                                                      children: [
                                                        Expanded(child: Text(list[index]['Name'].toString(),style: TextStyle(color: Color(0xFF000161),fontWeight: FontWeight.bold,fontSize: size.height*0.02),)),
                                                        Expanded(child: CircleAvatar(
                                                          backgroundColor: Colors.grey.shade200,
                                                          child: Icon(Icons.chevron_right,color: Color(0xFF000161),),
                                                        ),
                                                        ),
                                                      ],
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Text(list[index]['Context'].toString(),style: TextStyle(color: Color(0xFF000161),fontSize: size.height*0.016))),
                                                Expanded(
                                                  flex: 5,
                                                    child: Image.network(list[index]['ImgUrl'].toString()))
                                              ]
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
                      padding: EdgeInsets.only(top: size.height*0.02),
                      child: Row(
                        children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(Icons.video_call,color: Color(0xFF000161).withOpacity(0.7),),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Not Feeling too well ?',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: size.height*0.02
                            ),),
                            Text('Treat common symptoms with top specialists',style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: size.height*0.014
                            ),),
                          ],
                        ),

                      ],
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children:[
                        Expanded(
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              child: Icon(Icons.person,color: Color(0xFF000161).withOpacity(0.7),),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                              child: Text('Dry Eyes',
                                style: TextStyle(
                                    fontSize: size.height*0.016,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height*0.05, bottom: size.height*0.05),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade200,
                                  child: Icon(Icons.flutter_dash,color:Color(0xFF000161).withOpacity(0.7),),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                  child: Text('Flu',
                                    style: TextStyle(
                                        fontSize: size.height*0.016,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(Icons.fastfood_sharp,color: Color(0xFF000161).withOpacity(0.7),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                child: Text('Stomach Pain',
                                  style: TextStyle(
                                      fontSize: size.height*0.016,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(Icons.playlist_add_check_circle_outlined,color:Color(0xFF000161).withOpacity(0.7),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                child: Text('Ear Pain',
                                  style: TextStyle(
                                      fontSize: size.height*0.016,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      children:[
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(Icons.child_care_sharp,color: Color(0xFF000161).withOpacity(0.7),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                child: Text('Cough in Children',
                                  style: TextStyle(
                                      fontSize: size.height*0.016,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(Icons.currency_bitcoin,color: Color(0xFF000161).withOpacity(0.7),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                child: Text('Tootache',
                                  style: TextStyle(
                                      fontSize: size.height*0.016,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(Icons.accessibility_new,color: Color(0xFF000161).withOpacity(0.7),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                child: Text('Pimples Acne',
                                  style: TextStyle(
                                      fontSize: size.height*0.016,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey.shade200,
                                child: Icon(Icons.pregnant_woman,color: Color(0xFF000161).withOpacity(0.7),),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                child: Text('Pregnancy issues',
                                  style: TextStyle(
                                      fontSize: size.height*0.016,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.02),
                      child: Container(
                        width: size.width*0.9,
                        decoration: BoxDecoration(
                          border:  Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: TextButton(
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('View All Symptoms',style: TextStyle(color: Color(0xFF000161),),),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade200,
                        child: Icon(Icons.video_call,color: Color(0xFF000161),),
                      ),
                      SizedBox(
                        width: size.width*0.03,
                      ),
                      Expanded(
                        child: Text('Instant Video Consultations with specialists',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height*0.02
                        ),),
                      ),

                    ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                  ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.001,vertical: size.height*0.02),
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
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: size.height*0.35),
                              itemBuilder: (context,index)
                              {
                                if(!snapshot.hasData){
                                  return Center(child: CircularProgressIndicator(strokeWidth: 1.0));
                                }
                                else{
                                  try{
                                    return Padding(
                                      padding: EdgeInsets.symmetric(horizontal: size.width*0.02),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              height: size.height*0.15,
                                              width: size.width*0.5,
                                              child: Image.network(list[index]['ImgUrl'].toString(),fit: BoxFit.cover,),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(left: size.width*0.01),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                                    child: Text(list[index]['Body'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: size.height*0.017),),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(vertical: size.height*0.006),
                                                    child: Text(list[index]['Head'],style: TextStyle(fontSize: size.height*0.015),),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.symmetric(vertical: size.height*0.001),
                                                    child: Text('Available in ' + (list[index]['AvailTime']/60).toString() + ' mins',style: TextStyle(color: Colors.green),),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
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
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.02),
                    child: Container(
                      width: size.width*0.9,
                      decoration: BoxDecoration(
                        border:  Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('View All Specialists',style: TextStyle(color: Color(0xFF000161),),),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          child: Icon(Icons.chat,color: Color(0xFF000161),),
                        ),
                        SizedBox(
                          width: size.width*0.03,
                        ),
                        Expanded(
                          child: Text('Free expert answers to your health questions',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height*0.02
                          ),),
                        ),

                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.02),
                    child: Container(
                      width: size.width*0.9,
                      decoration: BoxDecoration(
                        border:  Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Ask a Free Questions',style: TextStyle(color: Color(0xFF000161),),),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height*0.3,
                    decoration: BoxDecoration(color: Color(0xFF000161)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: size.width*0.06),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('DRONAID',style: TextStyle(color: Colors.white,fontSize: size.height*0.05),),
                          Row(
                            children: [
                              Expanded(
                                child: Text('Our vision is to help mankind live healthier, longer lives by making quality healthcare accessible, affordable and convenient',style: TextStyle(color: Colors.white,fontSize: size.height*0.02),),),
                            ],
                          ),
                          Text('Made by ❤️',style: TextStyle(color: Colors.white,fontSize: size.height*0.02),),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

