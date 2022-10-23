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
                padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image(
                          fit: BoxFit.contain,
                          height: size.height*0.1,
                          image: AssetImage('assets/images/Online-Doctor-Consultation.jpeg'),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Instant Video Consult',
                              style: TextStyle(
                                  fontSize: size.width*0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text('Connect within 60 secs',style: TextStyle(
                                fontSize: size.width*0.03,
                                fontWeight: FontWeight.w300),),
                          ],
                        ),
                      ],
                    ),
                    ),
                    Container(
                      child: Column(
                            children: [
                              Image(
                                fit: BoxFit.contain,
                                height: size.height*0.1,
                                image: AssetImage('assets/images/OrderMedicine.png'),
                              ),
                              Column(
                                children: [
                                  Text('Medicines',
                                    style: TextStyle(
                                        fontSize: size.width*0.03,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Essentials at your door steps',style: TextStyle(
                                      fontSize: size.width*0.03,
                                      fontWeight: FontWeight.w300),),
                                ],
                              ),
                            ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile()
            ],
          ),
        ),
      ),
    );
  }
}

