import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  final String text,route;
  final Color color,textColor;
  RoundedButton({
    Key? key, required this.text,required this.color, required this.textColor,required this.route,
  }) : super(key: key) {
    // TODO: implement
  }

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width*0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: widget.color,
          ),
        child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 42),
            child: Text(widget.text,
              style: TextStyle(
                color: widget.textColor,
              ),),
          ),
            onPressed: (){
            setState((){
              Navigator.pushNamed(context, widget.route);
            },);
            }
        ),
      ),
    );
  }
}