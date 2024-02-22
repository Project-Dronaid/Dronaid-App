import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class EmergencyView extends StatefulWidget {
  const EmergencyView({super.key});

  @override
  State<EmergencyView> createState() => _EmergencyViewState();
}

class _EmergencyViewState extends State<EmergencyView> {
  GoogleMapController? _controller;
  LocationData? currentLocation;
  Map? droneLiveLocation;
  DatabaseReference db = FirebaseDatabase.instance.ref();

  double latitude = 0;
  double longitude = 0;

  Set<Marker> markers = {};
  List<LatLng> route = [];

  void getCurrentLocation() async {
    Location location = Location();
    await location.getLocation().then((location) => currentLocation = location);

    setState(() {});
  }

  void sendDroneCommand() async {
    await db.child("DRONE/Drone1/destination").update({
      "take-off": 1,
    });
  }

  void confirmRoute() async {
    getData();
    getCurrentLocation();
    route = [
      LatLng(latitude, longitude),
      LatLng(
          currentLocation!.latitude ?? 0.0, currentLocation!.longitude ?? 0.0),
    ];
    await db.child("DRONE/Drone1/destination").update({
      "latitude": currentLocation!.latitude,
      "longitude": currentLocation!.longitude,
    });
  }

  void stopDrone() async {
    await db.child("DRONE/Drone1/destination").update({
      "take-off": 0,
    });
  }

  void getData() async {
    db
        .child("DRONE/Drone1/live/")
        .onValue
        .listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        droneLiveLocation = event.snapshot.value as Map;
        latitude = droneLiveLocation!['latitude'];
        longitude = droneLiveLocation!['longitude'];

        print("$latitude  ,  $longitude");
        // _controller!.animateCamera(
        //   CameraUpdate.newLatLng(
        //     LatLng(latitude, longitude),
        //   ),
        // );

        setState(() {
          markers.clear();
          markers.add(Marker(
            markerId: const MarkerId("Drone 1"),
            position: LatLng(latitude, longitude),
            icon: BitmapDescriptor.defaultMarker,
          ));
        });
      } else if (event.snapshot.value == null) {
        print("no data");
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getCurrentLocation();
    getData();
    route = [];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This will be called after the first frame is displayed
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("This feature is under development!!"),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text("Okay"),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }


  // void updateMarker(LatLng coordinates) {
  //   setState(() {
  //     markers.clear();
  //     markers.add(
  //       Marker(
  //         markerId: const MarkerId("Drone1"),
  //         position: coordinates,
  //         icon: BitmapDescriptor.defaultMarker,
  //       ),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EMERGENCY",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27,), textAlign: TextAlign.center),
        backgroundColor: Colors.red.withOpacity(0.84),
        centerTitle: true,
      ),
      body: currentLocation == null
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Stack(
        children: [
          Expanded(
            child: GoogleMap(
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                    target: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!),
                    zoom: 14),
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
          ),
          // Positioned(
          //   width: 50,
          //   height: 25,
          //   bottom: 100,
          //   left: 50,
          //   child: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.black,
          //       ),
          //       child: const Text(
          //         "+",
          //         style: TextStyle(
          //           color: Colors.white,
          //         ),
          //       ),
          //       onPressed: () {
          //         setState(() {
          //           latitude += 0.0001;
          //           longitude += 0.0001;
          //           route.add(LatLng(latitude, longitude));
          //           markers.clear();
          //           markers.add(Marker(
          //             markerId: const MarkerId("Drone 1"),
          //             position: route[route.length - 1],
          //             icon: BitmapDescriptor.defaultMarker,
          //           ));
          //         });
          //       }),
          // ),

          Positioned(
            left: 15,
            bottom: 100,
            child: InkWell(
              onTap: sendDroneCommand,
              child: Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black54,
                    width: 5,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Call Drone",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17,), textAlign: TextAlign.center
                    ),
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            right: 15,
            bottom: 100,
            child: InkWell(
              onTap: stopDrone,
              child: Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black54,
                    width: 5,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Stop Drone",
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17,), textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 200,
            child: InkWell(
              onTap: confirmRoute,
              child: Container(
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black54,
                    width: 5,
                  ),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Confirm Route",
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17,), textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
