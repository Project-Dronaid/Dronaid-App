import 'package:dronaidapp/introScreens/introScreen.dart';
import 'package:dronaidapp/introScreens/introScreen4.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Screens/WelcomeScreen/welcomeBack.dart';
import 'introScreens/introScreen1.dart';
import 'introScreens/introScreen2.dart';
import 'introScreens/introScreen3.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 3);
              });
            },
            children: [
              IntroScreen(
                lottieUrl:
                    'https://assets3.lottiefiles.com/private_files/lf30_k985zjll.json',
                txt:
                    "Drone Delivery is possible now.",
              ),
              IntroScreen(
                lottieUrl:
                    'https://assets3.lottiefiles.com/temp/lf20_i8B3aE.json',
                txt:
                    "We cover every possible locations",
              ),
              IntroScreen(
                lottieUrl:
                    'https://assets5.lottiefiles.com/packages/lf20_ecvwbhww.json',
                txt:
                    "Medication available anytime.",
              ),
              IntroScreen(
                lottieUrl:
                    'https://assets6.lottiefiles.com/private_files/lf30_khO3Hb.json',
                txt:
                    "Fire rescue surveillance in real time.",
              ),
              // IntroScreen1(),
              // IntroScreen2(),
              // IntroScreen3(),
              // IntroScreen4(),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Icon(
                          Icons.arrow_back_outlined,
                        )),
                    onTap: () {
                      _controller.previousPage(
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn);
                    },
                  ),
                  SmoothPageIndicator(controller: _controller, count: 4),
                  onLastPage
                      ? GestureDetector(
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const WelcomeBack();
                            }));
                          },
                        )
                      : GestureDetector(
                          child: const Icon(Icons.arrow_forward_outlined),
                          onTap: () {
                            _controller.nextPage(
                                duration: const Duration(seconds: 1),
                                curve: Curves.easeIn);
                          },
                        ),
                ],
              ))
        ],
      ),
    );
  }
}
