import 'package:flutter/material.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});
  static const routeName = 'Tracking';


  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Container(
            height: 550,
            child: Image.asset(
              'assets/images/map2.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(

            padding: const EdgeInsets.only(top: 50),
            child: const Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: []),
                Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Delivery Status',
                      style:
                      TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                    )),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 560),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.access_alarm_sharp),
                  label: const Text("DELIVER IN"),
                ),
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.pin_drop),
                  label: const Text(
                    "DISTANCE",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 595),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 99),
                  child: const Text(
                    "09:13",
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Color.fromARGB(255, 23, 228, 33),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 114),
                  child: const Text(
                    "1.5km",
                    style: TextStyle(
                        fontSize: 25.0,
                        color: Color.fromARGB(255, 23, 228, 33),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 640),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 40.0),
                  child: const Text(
                    "ORDER:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 40.0),
                  child: const Text(
                    "Grill Sandwich",
                    style:
                    TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 40.0),
                  child: const Text(
                    "ADDRESS:",
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 40.0),
                  child: const Text(
                    "MIT, Eshwar Nagar, Manipal, Karnataka 576104",
                    style:
                    TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 760),
            child: Center(
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.phone_in_talk_sharp,
                  size: 20.0,
                  color: Colors.white,
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 23, 228, 33),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  debugPrint('pushed');
                },
                label: const Text(
                  'Call Support',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
