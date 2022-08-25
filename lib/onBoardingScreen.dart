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
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: const [
              IntroScreen1(),
              IntroScreen2(),
              IntroScreen3(),
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
                  SmoothPageIndicator(controller: _controller, count: 3),
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
