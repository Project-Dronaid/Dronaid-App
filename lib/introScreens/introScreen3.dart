import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen3 extends StatefulWidget{
  const IntroScreen3({Key? key}): super(key: key);
  @override
  _IntroScreen3State createState() => _IntroScreen3State();
}

class _IntroScreen3State extends State<IntroScreen3>{
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height*0.105,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: size.height*0.02),
          child: SizedBox(
            width: size.width*0.8,
            child: Image.asset('assets/images/banner.png'),
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height*0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Lottie.network('https://assets5.lottiefiles.com/packages/lf20_ecvwbhww.json'),
          ],
        ),
      ),
    );
  }
}