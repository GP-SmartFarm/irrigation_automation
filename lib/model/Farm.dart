import 'dart:ffi';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irrigation_automation/config/constants.dart';
import 'dart:io';

import 'package:irrigation_automation/model/Sensor.dart';


class Farm{

  String _id;
  double _area;
  String _governorate;
  String _region;
  double _lat_coordinate;
  double _long_coordinate;
  File _image;
  String _type_soil;
  bool _acceptId;
  double _elevation;
  String _hisimage;
Sensor _sensor;
  String get hisimage => _hisimage;

  set hisimage(String value) {
    _hisimage = value;
  }

  double get elevation => _elevation;

  set elevation(double value) {
    _elevation = value;
  }

  String get id => _id;

  double get lat_coordinate => _lat_coordinate;

  set lat_coordinate(double value) {
    _lat_coordinate = value;
  }

  Farm();
  Farm.load(this._id, this._area, _governorate, _region, this._lat_coordinate, this._long_coordinate, this._hisimage, this._type_soil){

        this.governorate=_governorate??"غير معرف";
        this.region=_region??"غير معرف";


  }


  String get governorate => _governorate;


  Farm.r(this._area, this._governorate, this._region, this._lat_coordinate,
      this._long_coordinate, this._image, this._type_soil,this._elevation);

  set type_soil(String value) {
    _type_soil = value;
  }

  File get image => _image;

  set image(File value) {
    _image = value;
  }



  set region(String value) {
    _region = value;
  }

  set governorate(String value) {
    _governorate = value;
  }

  set area(double value) {
    _area = value;
  }

  Sensor get sensor => _sensor;

  set sensor(Sensor value) {
    _sensor = value;
  }

  double get area => _area;

  String get region => _region;


  bool get acceptId => _acceptId;

  String get type_soil => _type_soil;

  double get long_coordinate => _long_coordinate;

  set long_coordinate(double value) {
    _long_coordinate = value;
  }

  factory Farm.fromJson(Map<String, dynamic> json) => Farm.load(
    json["farm_Id"].toString(),
    json["area"].toDouble(),
    json["governorate"],
    json["region"],
   json["latitude"],
 json["longitude"],
 json["image_farm"],
    json["type_Soil"],

  );

  static Future<List<Farm>>  getFarmsRequests(String id)
  async {
    print("${domin}/api/User/GetFarms/${id}/waiting");
    String url2 = "${domin}/api/User/GetFarms/${id}/waiting";


    var response = await http.get(Uri.parse(url2));

    print(response.body);
    List<Farm> data= List<Farm>.from(json.decode(response.body).map((x) => Farm.fromJson(x)));

    print("\n\n\n\n\n lenth = "+data.length.toString());
    return data;
  }





  static Future<List<Farm>>  getFarms(String id)  //get farms and his sensor data
  async {
    String url = "${domin}/api/User/GetFarms/${id}/accept";
    var response = await http.get(Uri.parse(url));

print(response.body);
    List<Farm> data= List<Farm>.from(json.decode(response.body).map((x) => Farm.fromJson(x)));
    if(data!=null)
      {
        for(int i=0;i<data.length;i++)
        {
          data[i].sensor=await Sensor.getSensor(data[i].id) ;
        }
        print("\n\n\n\n\n lenth = "+data.length.toString());
      }

    return data;
  }
}

//https://intelligencefarmers.azurewebsites.net/api/User/GetFarms/2