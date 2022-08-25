import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen2 extends StatefulWidget{
  const IntroScreen2({Key? key}): super(key: key);
  @override
  _IntroScreen2State createState() => _IntroScreen2State();
}

class _IntroScreen2State extends State<IntroScreen2>{
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
            Lottie.network('https://assets3.lottiefiles.com/temp/lf20_i8B3aE.json'),
          ],
        ),
      ),
    );
  }
}