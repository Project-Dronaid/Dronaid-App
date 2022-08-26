import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen4 extends StatefulWidget {
  const IntroScreen4({Key? key}) : super(key: key);

  @override
  _IntroScreen4State createState() => _IntroScreen4State();
}

class _IntroScreen4State extends State<IntroScreen4> {
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
              height: size.height*0.02,
            ),
            Lottie.network(
                'https://assets6.lottiefiles.com/private_files/lf30_khO3Hb.json'),
            const Text(
              "Lorem ipsum dolor sit amet. Ut exercitationem autem aut dolorum ",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}