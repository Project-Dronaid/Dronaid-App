import 'package:flutter/material.dart';

class MyCardWidget extends StatefulWidget {
  MyCardWidget(this.text, this.iconName,this.route);
  final String text;
  final IconData iconName;
  final String route;

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}


class _MyCardWidgetState extends State<MyCardWidget> {
  void nextpage(routename)
  {
    setState(() {
      Navigator.pushNamed(context, routename);
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Container(
          width : size.width*0.5,
          padding: new EdgeInsets.all(10.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Color(0xFFECECFA),
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    nextpage(widget.route);
                  },
                  child: ListTile(
                    leading: SizedBox(
                      height: size.height*0.05,
                      child: Icon(widget.iconName),
                    ),
                    title: Text(widget.text, style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500,)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}