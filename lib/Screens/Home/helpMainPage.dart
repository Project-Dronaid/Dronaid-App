import 'package:dronaidapp/Screens/Helps/Ambulance.dart';
import 'package:dronaidapp/Screens/Helps/Emergency.dart';
import 'package:dronaidapp/Screens/Helps/Fire.dart';
import 'package:dronaidapp/Screens/Helps/MedicalAid.dart';
import 'package:dronaidapp/Screens/Helps/Police.dart';
import 'package:dronaidapp/components/MyCardWidget.dart';
import 'package:dronaidapp/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dronaidapp/Screens/Home/locations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(13.35053, 74.793568),
    zoom: 15.5,
  );
  Set<Marker> _markers = {};
  late GoogleMapController _mapController;
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(
        const Marker(
            markerId: MarkerId('origin'),
            position: LatLng(13.350531, 74.793568),
            infoWindow: InfoWindow(
              title: 'Project Dronaid',
              snippet: 'Student Project Workshop',
            )),
      );
      controller.animateCamera(
        CameraUpdate.newCameraPosition(_initialCameraPosition),
      );
    });
  }
  // void getLocation() async {
  //
  // }
  final panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    void togglePanel() => panelController.isPanelOpen
        ? panelController.close()
        : panelController.open();
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.05;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.6;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(29, 56, 73, 1.0),
        title: Text('Search'),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: MySearchDelegate());
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: SlidingUpPanel(
        minHeight: size.height*0.19,
        maxHeight: size.height*0.5,
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        // panel: _createListMenu(),
        color: const Color.fromRGBO(29, 56, 73, 1.0),
        backdropColor: Colors.black,
        backdropTapClosesPanel: true,
        body: Stack(
          children: [
            GoogleMap(
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _onMapCreated(controller),
            markers: _markers,
          ), Positioned(
              bottom: size.height*0.28,
              width: size.width*0.2,
              right: size.width*0.02,
            child: FloatingActionButton(
            backgroundColor: Colors.white,
            foregroundColor: Colors.blue,
            onPressed: () {
              setState(() {
                _mapController.animateCamera(
                    CameraUpdate.newCameraPosition(_initialCameraPosition));
              });},
            child: Icon(Icons.center_focus_strong),
        ),
          ),
          ],),
        controller: panelController,
        collapsed: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(29, 56, 73, 1.0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0))),
          child: Padding(
            padding: EdgeInsets.only(bottom: 80.0,left: size.width*0.1,right: size.width*0.1),
            child: GestureDetector(
              onTap: togglePanel,
              child: Center(
                child: Container(
                  width: size.width*0.4,
                  height: size.height*0.005,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        panelBuilder: (controller) => PanelWidget(),
      ),
    );
  }
}
 
class MySearchDelegate extends SearchDelegate {
  List<String> searchResults  = [
    'Manipal',
    'Udupi',
    'Manglore',
    'Kunjibettu',
    'Delhi',
    'Mumbai',
    'Kolkata',
    'Chennai',
    'Banglore',
  ];
  @override
  List<Widget>? buildActions(BuildContext context) => [
    IconButton(onPressed: (){
      if (query.isEmpty) {
        close(context, null);
      }
      else
        query = '';
    }, icon: Icon(Icons.clear))
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: (){close(context, null); }, icon: Icon(Icons.arrow_back_outlined));

  @override
  Widget  buildResults(BuildContext context) => Center(
    child: Text(query),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult){
      final input = query;
      final result = searchResult;
      return result.contains(input);
    }).toList();
    
    return ListView.builder(
      itemCount: suggestions.length,
        itemBuilder: (context,index){
           final suggestion = suggestions[index];
           return ListTile(
             title: Text(suggestion),
             onTap: (){
               query = suggestion;
               showResults(context);
             },
           );
        });
  }

}



class PanelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
      margin: EdgeInsets.only(top: 36.0),
      color: const Color.fromRGBO(39, 77, 100, 1.0),
      child: Column(
        children: [
          Flexible(
            flex: 0,
            child: Row(
              children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: MyCardWidget("Medical Aid", Icons.medical_services, MedicalAidMarket.id)
                ),
                Flexible(
                    fit: FlexFit.loose,
                    child: MyCardWidget("Fire", Icons.fire_truck_outlined, Fire.id)),
              ],
            ),
          ),
          Flexible(
            flex: 0,
            child: Row(
              children: [
                Flexible(
                    fit: FlexFit.loose,
                    child: MyCardWidget(
                        "Ambulance", Icons.medical_services_rounded, Ambulance.id)),
                Flexible(
                    fit: FlexFit.loose,
                    child: MyCardWidget("Police", Icons.local_police, Police.id)),
              ],
            ),
          ),
          Flexible(
              flex: 0,
              fit: FlexFit.loose,
              child: MyCardWidget("Emergency", Icons.sos, Emergency.id))
        ],
      ));
}