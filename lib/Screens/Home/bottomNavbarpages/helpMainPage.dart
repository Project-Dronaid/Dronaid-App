import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:custom_info_window/custom_info_window.dart';
import 'package:dio/dio.dart';
import 'package:dronaidapp/Screens/Helps/Ambulance.dart';
import 'package:dronaidapp/Screens/Helps/Emergency.dart';
import 'package:dronaidapp/Screens/Helps/Fire.dart';
import 'package:dronaidapp/Screens/Helps/MedicalAid.dart';
import 'package:dronaidapp/Screens/Helps/Police.dart';
import 'package:dronaidapp/components/MyCardWidget.dart';
import 'package:dronaidapp/components/url.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;


class HelpPage extends StatefulWidget {
  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {


  var lat;
  var lon;
//Custom Info Window Controller Function//
  //For Marker Icon Image
  Uint8List? markerImage;
  //Custom Info Window controller initializer
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();
  //Custom Info Window Data function
  loadImageData() async {
    for(int index = 1; index <images.length; index++){
      final Uint8List markerIcon = await getBytesFromAssets(images[index], 125,125);
      _marker.add(
        Marker(markerId: MarkerId(index.toString()),
            position: _latlng[index],
            icon: BitmapDescriptor.fromBytes(markerIcon),
        ),
      );
    }
  }
  // Function for converting images to bytes for marker icon image.
  Future<Uint8List> getBytesFromAssets (String path, int height, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec  = await ui.instantiateImageCodec(data.buffer.asUint8List(),targetWidth: width,targetHeight: height);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }


//Current Location Mapping Marking//
  // Initial Camera Position.
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(13.344842, 74.786309),//13.344842, 74.786309 //13.35053, 74.793568
    zoom: 15.4746,
  );
  //Current Location Marker Set up function
  loadData(){
    _determinePosition().then((value) async {
      lat = value.latitude.toString();
      lon = value.longitude.toString();
      print(value.latitude.toString() + "  " +value.longitude.toString());
      _marker.add(
        Marker(markerId: const MarkerId('0'),
          position: LatLng(value.latitude, value.longitude),
          infoWindow: const InfoWindow(
            title: 'Current Location',
          ),
        ),
      );

      CameraPosition cameraposition = CameraPosition(
        zoom: 15.476  ,
        target: LatLng(value.latitude, value.longitude),);

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraposition));
      setState(() {
      });
    });
  }
  //Current Location Determination
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }


//Autocomplete function//
  //Text Editing Controller initializer
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingController1 = TextEditingController();
  // Unique Id for a device
  var uuid = const Uuid();
  // Session Token for personalizing service
  String _sessiontoken = '123456';
  //Session Token linked with Unique Id
  void onChange(){
    if(_sessiontoken==null){
      setState(() {
        _sessiontoken = uuid.v4();
      });
    }
    else{
      getSuggestion(textEditingController.text);
      getSuggestion(textEditingController1.text);
    }
  }
  //List of Dynamic Places which is generated under autocomplete
  List<dynamic> _placesList = [];
  //Suggestion function under autocomplete function
  void getSuggestion(String input) async {
    String kPLACES_API_KEY = 'AIzaSyC1_U9ZJk98Su3FtNnSpnKeIJpTPEai06M';
    String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request = '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessiontoken';

    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();
    print(data);
    if (response.statusCode == 200){
      setState(() {
        _placesList = jsonDecode(response.body.toString()) ['predictions'];
      });
    }else{
      throw Exception('Failed to load Data');
    }
  }


//Controllers Combination
  //Maps Completer used for controlling maps.
  Completer<GoogleMapController> _controller = Completer();
  // Panel Controller initializer
  final panelController = PanelController();


//LIST:LIST:LIST:LIST:LIST//
  //List of images for marker icons
  List<String> images = ['assets/images/home-delivery.png','assets/images/drone-delivery.png','assets/images/drone.png'];
  //List of markers that appears on screen which is dynamic
  List<Marker> _marker = [];
  //List of pre set markers
  List<Marker> _list = [
    const Marker(
      markerId: MarkerId('0'),
      position: LatLng(13.35053, 74.793568),
      infoWindow: InfoWindow(title: 'Dronaid',),),
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(13.3529363,74.7882884),
      infoWindow: InfoWindow(
        title: 'Kasturba Medical College',
        snippet: 'Hospital',
      ),
    ),
    const Marker(
      markerId: MarkerId('2'),
      position: LatLng(13.3444152,74.7944426),
      infoWindow: InfoWindow(
        title: 'MIT Playground',
        snippet: 'Ground',
      ),
    )];
  //List of pre set latlang coordinates
  List<LatLng> _latlng = [const LatLng(13.350486,74.793765),const LatLng(13.3529363,74.7882884),const LatLng(13.3444152,74.7944426)];

//Polygons
  Set<Polygon> _polygone = HashSet<Polygon>();
  Set<Polyline> _polyline = HashSet<Polyline>();
  List<LatLng> points = [
     const LatLng(13.344842, 74.786309),
     const LatLng(13.329760, 74.791855),
     const LatLng(13.336647, 74.793746),
     const LatLng(13.353193, 74.802395),
     const LatLng(13.344842, 74.786309),
  ];
  List<LatLng> _polyLatlng = [
    const LatLng(13.3444152,74.7944426), const LatLng(13.35053, 74.793568),const LatLng(13.352987, 74.791623),const LatLng(13.3529363,74.7882884)
  ];

  // String url=PROD_URL+"/user/sendlocation";
  //
  // void postdata() async{
  //   var dio= Dio();
  //   var body=jsonEncode({
  //     "lat": lat.toString(),
  //     "lon": lon.toString(),
  //   });
  //   try {
  //     Response response = await dio.post(url, data: body);
  //     print(response.data);
  //     if(response.statusCode==200){
  //     }
  //   }catch(err){
  //     print(err);
  //   }
  // }
  //InitState
  @override
  void initState() {
    // TODO: implement initState
    super.initState( );
    loadImageData();
    _marker.addAll(_list);
    loadData();
    textEditingController.addListener(() {
       onChange();
    });
    _polygone.add(
      Polygon(polygonId: const PolygonId('1'),points: points,
      fillColor: Colors.red.withOpacity(0.1),
        geodesic: true,
        strokeWidth: 4,
        strokeColor: Colors.redAccent,
      )
    );
    _polyline.add(
      Polyline(polylineId: const PolylineId('1'),
      points: _polyLatlng,
        width: 5,
        color: Colors.blue,
      ),
    );
  }

  // Main Build Function//
  @override
  Widget build(BuildContext context) {
    void togglePanel() => panelController.isPanelOpen
        ? panelController.close()
        : panelController.open();
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
                onTap: (position){
                  _customInfoWindowController.hideInfoWindow!();
                },
                mapToolbarEnabled: true,
                // onCameraMove: (position){
                //   _customInfoWindowController.onCameraMove!();
                // },
                markers: Set<Marker>.of(_marker),
                // polygons: _polygone,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                compassEnabled: true,
                zoomControlsEnabled: true,
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (GoogleMapController controller){
                  _controller.complete(controller);
                },
              zoomGesturesEnabled: true,
              polylines: _polyline,
            ),
            // CustomInfoWindow(
            //   controller: _customInfoWindowController, height: 100,
            //   width: 300,
            //   offset: 35,
            // ),
            Positioned(
              top: size.height*0.001,
              child: Padding(
                padding: EdgeInsets.only(top: size.height*0.025,left: size.width*0.05),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: SizedBox(
                    width: size.width*0.88,
                    height: size.height*0.2,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                              border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.search,
                            size:  30,),
                            title: TextFormField(
                              cursorColor: Colors.black,
                              controller: textEditingController ,
                              decoration: const InputDecoration(
                                  hintText: 'Search Places',
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: ListView.builder(
                            itemCount:  _placesList.length,
                            itemBuilder: (context,index){
                              return ListTile(
                                leading: const Icon(Icons.location_on,
                                color: Colors.black,),
                                onTap: () async {
                                  List<Location> locations = await locationFromAddress(_placesList[index]['description']);
                                  _marker.add(
                                    Marker(markerId: const MarkerId('4'),
                                      position: LatLng(locations.last.latitude, locations.last.longitude),
                                      infoWindow: InfoWindow(title: _placesList[index]['description'],),),);
                                  CameraPosition cameraposition = CameraPosition(
                                    zoom: 15.476  ,
                                    target: LatLng(locations.last.latitude, locations.last.longitude),);
                                  final GoogleMapController controller = await _controller.future;
                                  controller.animateCamera(CameraUpdate.newCameraPosition(cameraposition));
                                  setState(() {
                                  });
                                },
                                title: Text(_placesList[index]['description'])  ,
                              );
                            })),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // PanelWidget(),
      ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.location_on),
          onPressed: () async {
            _determinePosition().then((value) async {
              print(value.latitude.toString() + "  " +value.longitude.toString());
              _marker.add(
                Marker(markerId: const MarkerId('0'),
                  position: LatLng(value.latitude, value.longitude),
                  infoWindow: const InfoWindow(title: 'Current Location',),),);
              CameraPosition cameraposition = CameraPosition(
                zoom: 15.476  ,
                target: LatLng(value.latitude, value.longitude),);
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(CameraUpdate.newCameraPosition(cameraposition));
              setState(() {
              });
            });
          },
        ),
      ),
    );
  }
}




