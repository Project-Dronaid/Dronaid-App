import 'package:flutter/material.dart';

import 'constants.dart';

class ProfileCardWidgetwithOptions extends StatefulWidget {
  ProfileCardWidgetwithOptions({
    required this.iconData,
    required this.textContext,
    required this.iconDataWithArrow,
    required this.color,
    required this.onPress,
    required this.route,
  });

  final IconData iconData;
  final String textContext;
  final IconData iconDataWithArrow;
  final Color color;
  final Function onPress;
  final String route;

  @override
  State<ProfileCardWidgetwithOptions> createState() =>
      _ProfileCardWidgetwithOptionsState();
}

class _ProfileCardWidgetwithOptionsState
    extends State<ProfileCardWidgetwithOptions> {
  void onSearchButtonPressed(routeName) {
    setState(() {
      Navigator.pushNamed(context, routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.textContext,
      child: GestureDetector(
        onTap: () {
          onSearchButtonPressed(widget.route);
          widget.onPress;
        },
        child: Card(
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(40), // if you need this
          //   side: BorderSide(
          //     color: Colors.grey.withOpacity(0.0),
          //     width: 1,
          //   ),
          // ),
          elevation: 0,
          color: Colors.transparent,
          child: ListTile(
            // dense: true,
            leading: Container(
              // width: double.infinity,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: const Color(0xff8689C6),
                ),
              ),
              child: Icon(
                widget.iconData,
                color: widget.color,
              ),
            ),
            title: Text(
              widget.textContext,
              style: kProfileStyle,
            ),
            trailing: Icon(Icons.keyboard_arrow_right, color: const Color(0xff000162), size: 30,),
          ),
        ),
      ),
    );
  }
}
