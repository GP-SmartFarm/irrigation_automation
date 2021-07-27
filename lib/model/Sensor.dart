import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irrigation_automation/config/constants.dart';

class Sensor {
  Sensor({
    this.sensorId,
    this.farmId,
    this.dateTime,
    this.humidity,
    this.temperature,
  });

  int sensorId;
  int farmId;
  String dateTime;
  int humidity;
  int temperature;

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
    sensorId: json["sensor_Id"],
    farmId: json["farm_Id"],
    dateTime: json["date_Time"],
    humidity: json["humidity"],
    temperature: json["temperature"],
  );


  static Future<Sensor>  getSensor(String id)
  async {
    print("\n\n\n\n\n\n\ koko \n\n\n\n\n");
    print("${domin}/api/User/showSensorsData/${id}");
    String url2 = "${domin}/api/User/showSensorsData/${id}";


    var response = await http.get(Uri.parse(url2));

    print(response.body);
    List<Sensor> data= List<Sensor>.from(json.decode(response.body).map((x) => Sensor.fromJson(x)));
    if(data.length==0)
      {
        return  Sensor(  sensorId: 0,
          farmId: 0,
          dateTime: "0",
          humidity: 0,
          temperature: 0,);
      }
    print("\n\n\n\n\n lenth = "+data.length.toString());
    print("\n\n\n\n sensor data\n");
    print(data);
    return data[0];
  }
}
