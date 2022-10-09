import 'package:flutter/material.dart';

class Background2 extends StatelessWidget {
  final Widget child;
  const Background2({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            width: size.width*0.4,
            child: Image.asset('assets/images/main_top.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            width: size.width*0.2,
            child: Image.asset('assets/images/main_bottom.png'),
          ),
          child,
        ],
      ),
    );
  }
}