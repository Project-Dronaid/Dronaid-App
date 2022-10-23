import 'package:flutter/material.dart';


class Doctor extends StatefulWidget {
  const Doctor({Key? key}) : super(key: key);

  @override
  State<Doctor> createState() => _DoctorState();
}

class _DoctorState extends State<Doctor> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.05,vertical: size.height*0.01),
                child: Container(
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
                          Text('Search for doctors'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Flex(
                    direction: Axis.vertical,
                    children: [
                      ListView(
                      shrinkWrap: true,
                      children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: size.height*0.01),
                                child: Container(
                                  height: size.height*0.20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                      fit: BoxFit.contain,
                                      height: size.height*0.12,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                          child: Text('Instant Video Consult',
                                            style: TextStyle(
                                                fontSize: size.height*0.016,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                          child: Text('Connect within 60 secs',style: TextStyle(
                                              fontSize: size.height*0.013,
                                              fontWeight: FontWeight.w400),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                                  height: size.height*0.20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                        fit: BoxFit.contain,
                                        height: size.height*0.12,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                            child: Text('Medicines',
                                              style: TextStyle(
                                                  fontSize: size.height*0.016,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(vertical: size.height*0.005),
                                            child: Text('Essentials at your door steps',style: TextStyle(
                                                fontSize: size.height*0.013,
                                                fontWeight: FontWeight.w400),),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Row(children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFF8689C6),
                              child: Icon(Icons.person,color: Color(0xFF000161),),
                            ),
                            Text('Doctors you have Consulted with',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.height*0.02
                            ),),

                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: size.height*0.02),
                          child: Row(
                            children: [
                            CircleAvatar(
                              backgroundColor: Color(0xFF8689C6),
                              child: Icon(Icons.video_call,color: Color(0xFF000161),),
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
                                  backgroundColor: Color(0xFF8689C6),
                                  child: Icon(Icons.person,color: Color(0xFF000161),),
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
                                      backgroundColor: Color(0xFF8689C6),
                                      child: Icon(Icons.flutter_dash,color: Color(0xFF000161),),
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
                                    backgroundColor: Color(0xFF8689C6),
                                    child: Icon(Icons.fastfood_sharp,color: Color(0xFF000161),),
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
                                    backgroundColor: Color(0xFF8689C6),
                                    child: Icon(Icons.playlist_add_check_circle_outlined,color: Color(0xFF000161),),
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
                                    backgroundColor: Color(0xFF8689C6),
                                    child: Icon(Icons.child_care_sharp,color: Color(0xFF000161),),
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
                                    backgroundColor: Color(0xFF8689C6),
                                    child: Icon(Icons.currency_bitcoin,color: Color(0xFF000161),),
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
                                    backgroundColor: Color(0xFF8689C6),
                                    child: Icon(Icons.accessibility_new,color: Color(0xFF000161),),
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
                                    backgroundColor: Color(0xFF8689C6),
                                    child: Icon(Icons.pregnant_woman,color: Color(0xFF000161),),
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
                      ],
                    )],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

