import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  static const String id = "faq";

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Color(0xff000162),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF2F3FC),
        title: const Text(
          "Frequently Asked Questions",
          style: TextStyle(
            color: Color(0xff000162),
          ),
        ),
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFF2F3FC),
    );
  }
}