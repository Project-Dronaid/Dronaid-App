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
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
          //padding: EdgeInsets.all(10.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), // if you need this
            side: BorderSide(
              color: Colors.grey.withOpacity(0.0),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: ListTile(
              leading: Icon(
                widget.iconData,
                color: widget.color,
              ),
              title: Text(
                widget.textContext,
                style: kProfileStyle,
              ),
              // trailing: IconButton(
              //   icon: Icon(widget.iconDataWithArrow),
              //   onPressed: () {
              //     onSearchButtonPressed(widget.route);
              //     widget.onPress;
              //   },
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
