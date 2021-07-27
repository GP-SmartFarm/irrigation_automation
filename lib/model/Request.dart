import 'dart:convert';
import 'dart:io';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:irrigation_automation/config/constants.dart';

import 'package:irrigation_automation/model/Farm.dart';
import 'package:irrigation_automation/model/User.dart';

class Request{
  User _user=User();
  Farm _farm=Farm();

  Request();

  Farm get farm => _farm;

  set farm(Farm value) {
    _farm = value;
  }

  User get user => _user;

  set user(User value) {
    _user = value;
  }
  Map<String, dynamic> RequesttoJson()
  {
    print("\n\n\n\n\n\ncheck data \n\n\n\n\n");
    print(_farm.area);
    print(_farm.type_soil);
    print(_farm.governorate);
    print(_farm.region);
    print(_farm.long_coordinate);
    print(_farm.lat_coordinate);
    print(_farm.elevation);
    print(base64Encode(_farm.image.readAsBytesSync()));
    return {
      'FullName': _user.fullName,
      'Ssn_Id': _user.ssn_id,

      'Phone_Number': _user.phone,

      'UserName': _user.username,
      'Password_Number': _user.password,

      'Cartimage_ofAgriculture': base64Encode(_user.farmerCardImage.readAsBytesSync()),
      'Front_Cardimage': base64Encode(_user.nationalCardImageFront.readAsBytesSync()),
      'Back_Cardimage': base64Encode(_user.nationalCardImageBack.readAsBytesSync()),

      'Area': _farm.area,
      'Type_Soil': _farm.type_soil,
      'Governorate': _farm.governorate,
      'Region': _farm.region,
      'Longitude': _farm.long_coordinate,
      'Latitude': _farm.lat_coordinate,
      'Image_farm':  base64Encode(_farm.image.readAsBytesSync()),
      'hieght':farm.elevation
    };
  }

/*

        public string FullName { get; set; }
        public string Ssn_Id { get; set; }
        public Byte[] Cartimage_ofAgriculture { get; set; }
        public Byte[] Front_Cardimage { get; set; }
        public Byte[] Back_Cardimage { get; set; }
        public string Phone_Number { get; set; }
        public string UserName { get; set; }
        public string Password_Number { get; set; }
        public string Type_Soil { get; set; }
        public Double Area { get; set; }
        public string Governorate { get; set; }
        public string Region { get; set; }
        public Byte[] Image_farm { get; set; }
        public Double Longitude { get; set; }
        public Double Latitude { get; set; }

  */

  addRequest()
  async {

    farm.elevation= await getElevation(farm.lat_coordinate,farm.long_coordinate);

    var url = Uri.parse('${domin}/api/Request');
    print(url);
    var response;
    try
    {
      response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(RequesttoJson()),
      );
    }catch(e)
    {

      print(e.toString());
    }

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

  }






  Map<String, dynamic> RequestFarmtoJson()
  {
    print("\n\n\n\n\n\ncheck data \n\n\n\n\n");
    print(_user.id);
    print(_farm.area);
    print(_farm.type_soil);
    print(_farm.governorate);
    print(_farm.region);
    print(_farm.long_coordinate);
    print(_farm.lat_coordinate);
    print("height \n");
    print(_farm.elevation);
    print(base64Encode(_farm.image.readAsBytesSync()));
    print("all\n");
    return {


      "User_Id" : int.parse(_user.id),
      'Area': _farm.area,
      'Type_Soil': _farm.type_soil,
      'Governorate': _farm.governorate,
      'Region': _farm.region,
      'Longitude': _farm.long_coordinate,
      'Latitude': _farm.lat_coordinate,
      'Image_farm':  base64Encode(_farm.image.readAsBytesSync()),
          'hieght':_farm.elevation
    };
  }
  addRequestnewFarm()
  async {

    farm.elevation= await getElevation(farm.lat_coordinate,farm.long_coordinate);


    var url = Uri.parse('${domin}/api/User/AddFarm');

    print("\n\n\n\nsamy\n\n\n\n");
    var response;
  try
    {
      print("\n\n\n\n in e \n\n\n\n");
      response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(RequestFarmtoJson()),
      );
      print("\n\n\n\n after e \n\n\n\n");

    }catch(e)
    {

      print(e.toString());
    }


    // var response = await http.post(url, body:{"FullName":"hassan","User_image":"ff","User_Card_Front":"ff","User_Card_Back":"ff","Phone_number":"ff","UserNme":"ff","Password_number":"ff","Type_soil":"ff","Area":"ff","Governorate":"gg","Farm_image":"ll"} );
    //       headers: <String, String>{
    //        'Content-Type': 'application/json; charset=UTF-8',
    //      },
    print("\n\n\n\nhassan\n\n\n\n");

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    //print("\n\n\n\n\n\n\n\n\n\n\n\nn\n\ndata sended here");
    // print(RequesttoJson());
    //print("\n\n data sended here");

    print("\ndata \n\n");
    print(RequestFarmtoJson());
  }

}

















Future<double> getElevation(double lat_coordinate,double long_coordinate)
async {
  print("https://api.stormglass.io/v2/elevation/point?lat=${lat_coordinate}&lng=${long_coordinate}");
  String url2 =
      'https://api.stormglass.io/v2/elevation/point?lat=${lat_coordinate}&lng=${long_coordinate}';

  String apiKey =
      'f73f0452-d393-11eb-b7ef-0242ac130002-f73f051a-d393-11eb-b7ef-0242ac130002';


  var response = await http.get(Uri.parse(url2),
      headers: {HttpHeaders.authorizationHeader: apiKey});


  final _extractedData = json.decode(response.body) as Map<String, dynamic>;
  print("\n\n\n\n\nheight  ${_extractedData["data"]["elevation"]} \n\n\n\nn\n");

  return _extractedData["data"]["elevation"];
}


//Connection timed out, errno = 110, address = 192.168.1.5, port = 48986

//local  https://10.0.2.2:44371/api/User/Getdata
// HandshakeException: Handshake error in client (OS Error:
//I/flutter (29765): 	CERTIFICATE_VERIFY_FAILED: unable to get local issuer certificate(handshake.cc:354))

//https://10.0.2.2:8000/api/User/Getdata
//I/flutter (29765): SocketException: OS Error: Connection timed out, errno = 110, address = 10.0.2.2, port = 54745




//const DOMAIN = 'http://10.0.3.2:50107/api/';
//    const CATEGORY_ENDPOINT = DOMAIN + 'categories';