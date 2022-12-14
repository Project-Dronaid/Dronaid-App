import 'package:dronaidapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatefulWidget {
  static const String id = "support";

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "Feel Free To ask. We are Ready to Help",
      child: Scaffold(
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
            "Assistance & Support",
            style: TextStyle(
              color: Color(0xff000162),
            ),
          ),
          elevation: 0,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFFF2F3FC),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          children: [
            Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/supportPage.jpg'),
                ),
                SizedBox(height: 50,),
                GestureDetector(
                  onTap: (){
                    launchUrl(Uri.parse("tel:9484666168"));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.call,
                        size: 30,
                        color: Color(0xff00078B),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Phone Number",
                            style: blueTextStyle,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "+91 9484666168",
                            style: lightBlueTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Divider(),
                SizedBox(height: 10,),
                GestureDetector(
                  onTap: (){
                    print("On tap");
                    launchUrl(Uri.parse("mailto:harsh.mcisma@learner.manipal.edu"));
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.call,
                        size: 30,
                        color: Color(0xff00078B),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "E-mail address",
                            style: blueTextStyle,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "info@piqo.design",
                            style: lightBlueTextStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
