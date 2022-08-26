import 'package:dronaidapp/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  static const double fabHeightClosed = 116.0;
  double fabHeight = fabHeightClosed;
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(13.35668164832287, 74.78948939733098),
    zoom: 13.5,
  );

  GoogleMapController? _googleMapController;
  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        backdropEnabled: true,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        panel: _createListMenu(), color: Colors.blueGrey, backdropColor: Colors.blue, backdropTapClosesPanel: true,

        body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController,
        ),
        collapsed: Container(decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0))),
        child: Center(child: Text('Slide Upwards', style: TextStyle(color: Colors.white),),),),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.blue,
        onPressed: () => _googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(_initialCameraPosition)),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }

 Widget _createListMenu() {
    return Container(margin: const EdgeInsets.only(top: 36.0), color: Colors.white,
      child:Row(
        children: [

        ],
      )


    );

 }
}
