import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  String lottieUrl, txt;

  IntroScreen({Key? key, required this.lottieUrl, required this.txt})
      : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.105,
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: size.height * 0.02),
          child: SizedBox(
            width: size.width * 0.8,
            child: Image.asset('assets/images/banner.png'),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/orange_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        height: size.height * 0.7,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Lottie.network(widget.lottieUrl),
            Text(
              widget.txt,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
