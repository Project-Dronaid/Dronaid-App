import 'package:dronaidapp/introScreens/introScreen.dart';
import 'package:dronaidapp/onBoarding/background2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Screens/WelcomeScreen/welcomeBack.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String id = "onBoarding";

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                    // 'https://drive.google.com/file/d/1cKQA4ocwLZQdz8-sjorchz167bkHvnY6/view?usp=sharing',
                    'https://assets3.lottiefiles.com/private_files/lf30_k985zjll.json',
                txt: "Drone Delivery is possible now.",
              ),
              IntroScreen(
                lottieUrl:
                    'https://assets3.lottiefiles.com/temp/lf20_i8B3aE.json',
                txt: "We cover every possible locations",
              ),
              IntroScreen(
                lottieUrl:
                    'https://assets5.lottiefiles.com/packages/lf20_ecvwbhww.json',
                txt: "Medication available anytime.",
              ),
              IntroScreen(
                lottieUrl:
                    'https://assets6.lottiefiles.com/private_files/lf30_khO3Hb.json',
                txt: "Fire rescue surveillance in real time.",
              ),
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
                          color: Colors.blueAccent,
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
                              color: Colors.blueAccent,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, WelcomeBack.id);
                          },
                        )
                      : GestureDetector(
                          child: const Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.blueAccent,
                          ),
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
