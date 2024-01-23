import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Tracking extends StatefulWidget {
  const Tracking({super.key});
  static const routeName = 'Tracking';

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  GoogleMapController? _controller;
  LocationData? currentLocation;

  void getCurrentLocation() async {
    Location location = Location();
    await location.getLocation().then((location) => currentLocation = location);

    setState(() {});
  }

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Status"),
      ),
      body: currentLocation == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                GoogleMap(
                    initialCameraPosition: CameraPosition(
                  target: LatLng(
                    currentLocation!.latitude!,
                    currentLocation!.longitude!,
                  ),
                  zoom: 20,
                )),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    height: 250,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "09:13",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 23, 228, 33),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Order #123456',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              Text('Delivery Status: In Transit'),
                              // SizedBox(height: 8.0),

                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "1.5km",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Color.fromARGB(255, 23, 228, 33),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('Estimated Arrival: 10:30 AM'),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    // width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    child: const Text(
                                      "ORDER:",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                  Container(
                                    // width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    child: const Text(
                                      "Grill Sandwich",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Container(
                                    // width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    child: const Text(
                                      "ADDRESS:",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                  Container(
                                    // width: double.infinity,
                                    padding: const EdgeInsets.all(8),
                                    child: const Text(
                                      "MIT, Eshwar Nagar, Manipal, Karnataka 576104",
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          child: Center(
                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.phone_in_talk_sharp,
                                size: 20.0,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 23, 228, 33),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                              onPressed: () {
                                debugPrint('pushed');
                              },
                              label: const Text(
                                'Call Support',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        // SizedBox(height: 8.0),

                      ],
                    ),
                  ),
                ),

                //       Container(
                //         padding: const EdgeInsets.only(left: 99),
                //         child: const Text(
                //           "09:13",
                //           style: TextStyle(
                //             fontSize: 25.0,
                //             color: Color.fromARGB(255, 23, 228, 33),
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         padding: const EdgeInsets.only(left: 114),
                //         child: const Text(
                //           "1.5km",
                //           style: TextStyle(
                //               fontSize: 25.0,
                //               color: Color.fromARGB(255, 23, 228, 33),
                //               fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //
                //
                //
                // Container(
                //   padding: EdgeInsets.only(top: 640),
                //   child: Column(
                //     children: [
                //       Container(
                //         width: double.infinity,
                //         padding: const EdgeInsets.only(left: 40.0),
                //         child: const Text(
                //           "ORDER:",
                //           style: TextStyle(fontSize: 15.0),
                //         ),
                //       ),
                //       Container(
                //         width: double.infinity,
                //         padding: const EdgeInsets.only(left: 40.0),
                //         child: const Text(
                //           "Grill Sandwich",
                //           style:
                //           TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 20,
                //       ),
                //       Container(
                //         width: double.infinity,
                //         padding: const EdgeInsets.only(left: 40.0),
                //         child: const Text(
                //           "ADDRESS:",
                //           style: TextStyle(fontSize: 15.0),
                //         ),
                //       ),
                //       Container(
                //         width: double.infinity,
                //         padding: const EdgeInsets.only(left: 40.0),
                //         child: const Text(
                //           "MIT, Eshwar Nagar, Manipal, Karnataka 576104",
                //           style:
                //           TextStyle(fontSize: 25.0, fontWeight: FontWeight.w500),
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 20,
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   padding: const EdgeInsets.only(top: 760),
                //   child: Center(
                //     child: ElevatedButton.icon(
                //       icon: const Icon(
                //         Icons.phone_in_talk_sharp,
                //         size: 20.0,
                //         color: Colors.white,
                //       ),
                //       style: ElevatedButton.styleFrom(
                //           backgroundColor: const Color.fromARGB(255, 23, 228, 33),
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(20.0))),
                //       onPressed: () {
                //         debugPrint('pushed');
                //       },
                //       label: const Text(
                //         'Call Support',
                //         style: TextStyle(fontSize: 18, color: Colors.white),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
    );
  }
}
