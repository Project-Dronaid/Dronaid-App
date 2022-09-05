import 'package:dronaidapp/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: AppBar(
        title: Text('Search'),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: MySearchDelegate());
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: SlidingUpPanel(
        maxHeight: 550.0,
        backdropEnabled: true,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
        panel: _createListMenu(),
        color: const Color.fromRGBO(29, 56, 73, 1.0),
        backdropColor: Colors.blue,
        backdropTapClosesPanel: true,
        body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController,
        ),
        collapsed: Container(
          decoration: BoxDecoration(
              color: const Color.fromRGBO(29, 56, 73, 1.0),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0))),
          child: Center(
            child: Text(
              'Slide Upwards',
              style: TextStyle(color: Colors.white, fontSize: 19.0, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black54,
        foregroundColor: Colors.blue,
        onPressed: () {
          setState(() {
            _googleMapController?.animateCamera(
                CameraUpdate.newCameraPosition(_initialCameraPosition));
          });},
        child: Icon(Icons.center_focus_strong),
      ),
    );
  }

  Widget _createListMenu() {
    return Container(
        margin: const EdgeInsets.only(top: 36.0),
        color: const Color.fromRGBO(39, 77, 100, 1.0),
        child: Column(
          children: [
            Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: MyCardWidget("Medical Aid", Icons.medical_services, 36)),
            Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: MyCardWidget("Fire", Icons.fire_truck_outlined, 36)),
            Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: MyCardWidget(
                    "Ambulance", Icons.medical_services_rounded, 36)),
            Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: MyCardWidget("Police", Icons.local_police, 36)),
            Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: MyCardWidget("Emergency", Icons.sos, 36))
          ],
        ));
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

class MyCardWidget extends StatefulWidget {
  MyCardWidget(this.text, this.iconName, this.iconSize);
  String text = "Hello";
  IconData iconName = Icons.add;
  double iconSize;

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: new EdgeInsets.all(10.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.redAccent,
        elevation: 6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: SizedBox(
                child: Icon(widget.iconName, size: widget.iconSize),
                height: 50,
                width: 50,
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.text, style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500,)),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
