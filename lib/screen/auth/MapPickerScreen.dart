import 'dart:async';
import 'package:geocoder/geocoder.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:irrigation_automation/services/Location_service.dart';
import 'package:location/location.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;


class MapPickerScreen extends StatefulWidget {
  @override
  State<MapPickerScreen> createState() => MapPickerScreenState();
}

class MapPickerScreenState extends State<MapPickerScreen> {

  Timer timer;
  @override
  void initState() {
    super.initState();
    //callApi();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _set_adress());
  }



  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(30.04522, -31.23340),
    zoom: 14.4746,
  );

  LatLng currentLocation=_initialCameraPosition.target;
  var _locality;
  var _adminArea;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  mapType: MapType.hybrid,
                  initialCameraPosition: _initialCameraPosition,
                  onMapCreated: (GoogleMapController controller) async {
                    _controller.complete(controller);
                    await _set_adress();
              //      print("\n\n    set adress\n\n\n\n${_locality}\n\n\n\n\n");
                  },
                  onCameraMove: (CameraPosition newPos)  {
                    setState(()  {
                      currentLocation=newPos.target;
                    });
                    //  await _set_adress();

                  },
                ),
                SizedBox(
                  height: 120,
                  width: 100,
                  child: Image.asset("assets/images/marker.png"),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10,bottom: 30),
                          child: FloatingActionButton(
                            onPressed: () async {
                             // print("\n\nn\n\n\n\njjjjjjj");
                              await _getMyLocation();
                            },
                            //label: Text('To the lake!'),
                            child: Icon(Icons.gps_fixed),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            height: 20,
            alignment: Alignment.center,
            child: Text("محافظة :  ${_adminArea} .مدينة: ${_locality}"),
          ),
        ],
      ),
    );
  }

  Future<void> _animateCamera(LocationData _location) async {

    final GoogleMapController controller = await _controller.future;
    CameraPosition _cameraPosition = CameraPosition(
      //  bearing: 192.8334901395799,
        target: LatLng(_location.latitude, _location.longitude),
        // tilt: 59.440717697143555,
        zoom: 19.151926040649414
    );
 //   print("\n\n\n\n\n\n\n\n\n\n\n Lat:  ${currentLocation.latitude} ,long: ${currentLocation.longitude}");
    controller.animateCamera(CameraUpdate.newCameraPosition(_cameraPosition));
  }
  Future<void> _getMyLocation() async {
   // print("\n\n\n\n\n\n\n\n\n\n\n Lat:  ${currentLocation.latitude} ,long: ${currentLocation.longitude}");


    LocationData _myLocation = await LocationServices().getLocation();
    print("\n\n\n\n\n\nmy\n\n\n\n\n house location   Lat:  ${_myLocation.latitude} ,long: ${_myLocation.longitude}");



////////////////////////////////
    var url = Uri.parse('https://maps.googleapis.com/maps/api/elevation/json?locations=30.1266764,31.1298977&key=AIzaSyBw1WUQtQy3A0Tz34h38CTjavcRisUJiEg');
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n         the link \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");

    var response;
    try
    {
      print("\n\n\n\n in e \n\n\n\n");
      response = await http.get(url);
      print("\n\n\n\n after e \n\n\n\n");
    }catch(e)
    {
      print(e.toString());
    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    /////////////////////////////////////////////////////
    _animateCamera(_myLocation);
  }

  Future<void> _set_adress() async {

    //  Future.delayed(const Duration(milliseconds: 500), () async {

// Here you can write your code
    final coordinates = new Coordinates(
        currentLocation.latitude, currentLocation.longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(
        coordinates);
    var first = addresses.first;
    _locality=first.locality ;
    _adminArea=first.adminArea;
 //   print('\n\n\n\n\n\n\n\n  ${first.locality},that ${first.adminArea},${first.subLocality}, ff${first.subAdminArea}ff,${first.addressLine}tt, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}\n${first.featureName} : ${first.addressLine}');

    setState(() {
      // Here you can write your code for open new view
    });

    //};



  }

}