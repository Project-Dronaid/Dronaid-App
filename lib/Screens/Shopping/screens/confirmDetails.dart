import 'package:dronaidapp/Screens/Shopping/Razorpay/razor.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

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

  Future getCurrentLocation() async {
    Location location = Location();
    await location.getLocation().then((location) => currentLocation = location);

    markers.add(
      Marker(
        markerId: const MarkerId("Destination"),
        position:
            LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
      ),
    );

    setState(() {});
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
                  onTap: (LatLng destination) {
                    setState(() {
                      // destinationLongitude = destination.longitude;
                      // destinationLatitude = destination.latitude;
                      confirmDestination = destination;
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
                    height: 120,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                      children: [
                        Row(
                          children: [
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
