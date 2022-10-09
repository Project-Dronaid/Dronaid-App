import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dronaidapp/onBoarding/background2.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  String lottieUrl, txt;

  IntroScreen({
    Key? key,
    required this.lottieUrl,
    required this.txt,
  }) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background2(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          height: size.height,
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Lottie.network(widget.lottieUrl)),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.05,
                  right: size.width * 0.05,
                ),
                child: Text(
                  widget.txt,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.2,
              )
            ],
          ),
        ),
    );
  }
}
