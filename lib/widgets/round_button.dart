import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  // Initializing loading variable with false
  final bool loading;
  const RoundButton(
      {Key? key,
      required this.title,
      required this.onTap,
      this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            // Here we are checking if loading is true then show the circular indicator otherwise show text
            child: loading
                ? const CircularProgressIndicator(
                    // Stroke width is to change the width of spinner
                    strokeWidth: 3,
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  )),
      ),
    );
  }
}
