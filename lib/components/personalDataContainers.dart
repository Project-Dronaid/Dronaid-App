import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  Widget childOfContainer;
  double num;

  DataContainer({
    Key? key,
    required this.childOfContainer,
    required this.num,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      width: width/num,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(
          color: const Color(0xff8689C6),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 21,
        vertical: 16,
      ),
      child: childOfContainer,
    );
  }
}
