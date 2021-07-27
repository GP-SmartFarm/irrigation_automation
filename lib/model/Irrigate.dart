import 'package:irrigation_automation/config/constants.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Irrigate {
  Irrigate({
    this.dateTime,
    this.quantity,
  });

  String dateTime;
  double quantity;

  factory Irrigate.fromJson(Map<String, dynamic> json) => Irrigate(
    dateTime: json["date_time"],
    quantity: json["quantity"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "date_time": dateTime,
    "quantity": quantity,
  };

  static Future<List<Irrigate>>  getIrrigates(String id)
  async {
    print("${domin}/api/User/Showirregation/${id}");
    String url2 = "${domin}/api/User/Showirregation/${id}";


    var response = await http.get(Uri.parse(url2));

    print(response.body);
    List<Irrigate> data= List<Irrigate>.from(json.decode(response.body).map((x) => Irrigate.fromJson(x)));

    print("\n\n\n\n\n lenth = "+data.length.toString());
    return data;
  }


}
