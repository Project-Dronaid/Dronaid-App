import 'dart:convert';

import 'package:dronaidapp/Screens/Shopping/Razorpay/razor.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../provider/cart.dart';

class ConfirmDetails extends StatefulWidget {
  const ConfirmDetails({super.key});
  static const String routeName = "confirm-details";

  @override
  State<ConfirmDetails> createState() => _ConfirmDetailsState();
}

class _ConfirmDetailsState extends State<ConfirmDetails> {
  LocationData? currentLocation;
  Set<Marker> markers = {};
  LatLng? confirmDestination;
  double? destinationLatitude;
  double? destinationLongitude;
  String locationAddress = "";

  Future getCurrentLocation() async {
    Location location = Location();
    await location.getLocation().then((location) => currentLocation = location);

    // markers.add(
    //   Marker(
    //     markerId: const MarkerId("Destination"),
    //     position:
    //         LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
    //   ),
    // );
    await getAddress(currentLocation!.latitude!, currentLocation!.longitude!);

    setState(() {});
  }

  Future getAddress(double latitude, double longitude) async {
    String key = "AIzaSyC1_U9ZJk98Su3FtNnSpnKeIJpTPEai06M";
    http.Response res = await http.get(Uri.parse(
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$key"));
    var data = res.body.toString();

    print(data);
    setState(() {
      locationAddress = jsonDecode(data)["results"][0]["formatted_address"];
      confirmDestination =
          LatLng(latitude, longitude);

    });
  }

  @override
  void initState() {
    getCurrentLocation();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Delivery Status",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: (currentLocation == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(
              children: [
                GoogleMap(
                  mapType: MapType.hybrid,
                  onTap: (LatLng destination) {
                    setState(() {
                      // destinationLongitude = destination.longitude;
                      // destinationLatitude = destination.latitude;
                      // confirmDestination = destination;
                      getAddress(destination.latitude, destination.longitude);
                      markers.clear;
                      markers.add(
                        Marker(
                          markerId: const MarkerId("Destination"),
                          position: destination,
                          icon: BitmapDescriptor.defaultMarker,
                        ),
                      );
                    });
                  },
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                      currentLocation!.latitude!,
                      currentLocation!.longitude!,
                    ),
                    zoom: 15,
                  ),
                  markers: markers,
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 260,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(245, 238, 248, 0.8),
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DecoratedBox(
                          decoration: BoxDecoration(),
                          child: Text(
                            "Delivering at:",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            locationAddress,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white60,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Center(
                                child: ElevatedButton.icon(
                                  icon: const Icon(
                                    Icons.location_on_outlined,
                                    size: 20.0,
                                    color: Colors.white,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: const Size(330, 60),
                                      elevation: 4,
                                      backgroundColor: const Color(0xFF8689C6),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(60.0))),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RazorPayClass(
                                          Amount: (cart.totalAmount).round(),
                                          destination: confirmDestination,
                                          address: locationAddress,
                                        ),
                                      ),
                                    );
                                  },
                                  label: const Text(
                                    'Confirm Location',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
