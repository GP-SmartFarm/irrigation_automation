
import 'package:flutter_icons/flutter_icons.dart';
import 'package:location/location.dart';

class LocationServices{

  Future<LocationData> getLocation()async{
    Location location=new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled)
      {
        _serviceEnabled=await location.requestService();
        if(!_serviceEnabled)
          {
            return _locationData ;
          }
      }

    _permissionGranted=await location.hasPermission();
    if(_permissionGranted==PermissionStatus.DENIED)

      {
        _permissionGranted=await location.requestPermission();
        if(_permissionGranted!=PermissionStatus.GRANTED)
          {
            throw _locationData;
          }
      }
    _locationData = await location.getLocation();
    return _locationData;
  }
}