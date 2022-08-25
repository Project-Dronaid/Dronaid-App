import 'package:flutter/material.dart';
import 'package:project_dronaid/constants.dart';

class OrDivider extends StatelessWidget{
  const OrDivider({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height*0.02),
      width: size.width*0.8,
      child: Row(
        children: const <Widget>[
          Expanded(child: Divider(
            color: Color(0xFFD9D9D9),
            height: 1.5,
          ),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('OR',style: TextStyle(color: kPrimaryColor,
                fontWeight: FontWeight.w600),),
          ),
          Expanded(child: Divider(
            color: Color(0xFFD9D9D9),
            height: 1.5,
          ),),
        ],
      ),
    );
  }
}