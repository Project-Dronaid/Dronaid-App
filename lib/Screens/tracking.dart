import 'package:firebase_database/firebase_database.dart';
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
  Map? droneLiveLocation;
  Map? destinationData;
  DatabaseReference db = FirebaseDatabase.instance.ref();
  String? status;
  int? statusCode;

  double? latitude;
  double? longitude;

  Set<Marker> markers = {};
  List<LatLng> route = [];

  Future getCurrentLocation() async {
    Location location = Location();
    await location.getLocation().then((location) => currentLocation = location);

    markers.add(
      Marker(
        markerId: const MarkerId("Destination"),
        position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
      ),);


    setState(() {});
  }

  Future getDroneData() async {
    db.child("DRONE/Drone1/").onValue.listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        droneLiveLocation = event.snapshot.value as Map;
        latitude = droneLiveLocation!['live']!['latitude'];
        longitude = droneLiveLocation!['live']!['longitude'];
        statusCode = droneLiveLocation!['destination']!['status'];
        print("${latitude!}  ,  ${longitude!}");
        // _controller!.animateCamera(
        //   CameraUpdate.newLatLng(
        //     LatLng(latitude, longitude),
        //   ),
        // );

        setState(() {
          if (statusCode == 0){
            status = "In Transit";
          } else if (statusCode == 1){
            status = "On the way";
          } else if (statusCode == 2){
            status = "Delivered";
          }
          markers.clear();
          markers.add(Marker(
            markerId: const MarkerId("Drone 1"),
            position: LatLng(latitude!, longitude!),
            icon: BitmapDescriptor.defaultMarker,
          ));
          markers.add(
              Marker(
                markerId: const MarkerId("Destination"),
                position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
              ),);
          route = [
            LatLng(latitude!, longitude!),
            LatLng(
                currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
          ];
        });
      } else if (event.snapshot.value == null) {
        print("no data");
      }
    });
  }

  void confirmRoute() async {
    await getDroneData();
    await getCurrentLocation();
    route = [
      LatLng(13.352584272921971, 74.79290286436944),
      LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    ];
    await db.child("DRONE/Drone1/destination").update({
      "latitude": currentLocation!.latitude,
      "longitude": currentLocation!.longitude,
    });
  }

//   Future deliveryStatus() async {
//     db.child("DRONE/Drone1/destination/").onValue.listen((DatabaseEvent event) {
//       if (event.snapshot.value != null) {
//         destinationData = event.snapshot.value as Map;
//         int code = destinationData!['status'];
//         if (code == 0) {
//           status = "order placed";
//         }
//         else if (code == 1) {
//           status = "on the way";
//         }
//       }
//     });
//
// }

  @override
  void initState() {
    confirmRoute();
    route = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text("Delivery Status", style: TextStyle(color: Colors.white),),
      ),
      body: (latitude == null || longitude == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        // currentLocation!.latitude!,
                        // currentLocation!.longitude!,
                        latitude!,
                        longitude!,
                      ),
                      zoom: 15,
                    ),
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    onMapCreated: (controller) {
                      setState(() {
                        _controller = controller;
                      });
                    },
                    markers: markers,
                    polylines: {
                      Polyline(
                          polylineId: const PolylineId("Live route"),
                          points: route,
                          zIndex: 5),
                    }),
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

                              Text(
                                'Order #123456',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),

                              Text('Delivery Status: $status'),
                              // SizedBox(height: 8.0),
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
                                      "ORDER TYPE:",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                  Container(
                                    // width: double.infinity,
                                    // padding: const EdgeInsets.all(4),
                                    child: const Text(
                                      "Medicines",
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
                                      "DESTINATION ADDRESS:",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        // width: double.infinity,
                                        width: 240,
                                        // padding: const EdgeInsets.all(8),
                                        child: const Text(
                                          "MIT QUADRANGLE, Eshwar Nagar, Manipal, Karnataka 576104",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(

                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ],
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


                          padding: const EdgeInsets.all(16),
                          child: Center(

                            child: ElevatedButton.icon(
                              icon: const Icon(
                                Icons.phone_in_talk_sharp,
                                size: 20.0,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(330, 60),
                                elevation: 4,
                                  backgroundColor:
                                  const Color(0xFF8689C6),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(60.0))),
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
