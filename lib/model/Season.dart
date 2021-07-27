import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:irrigation_automation/config/constants.dart';
import 'package:irrigation_automation/model/Farm.dart';

class Season
{
   int _Season_Id;
   int _Farm_ID ;
   String _Date_Beganing ;
   String _Crop_Name ;
   int get Season_Id => _Season_Id;
   Season();
   Season.load(
      this._Season_Id, this._Farm_ID, this._Date_Beganing, this._Crop_Name);

  set Season_Id(int value) {
    _Season_Id = value;
  }
   int get Farm_ID => _Farm_ID;
   String get Crop_Name => _Crop_Name;

  set Crop_Name(String value) {
    _Crop_Name = value;
  }
  String get Date_Beganing => _Date_Beganing;
  set Date_Beganing(String value) {
    _Date_Beganing = value;
  }
  set Farm_ID(int value) {
    _Farm_ID = value;
  }
   Map<String, dynamic> toJson()
   {
     return
       {
         "Crop_Name" :_Crop_Name,
         "Farm_ID" : _Farm_ID
       };
   }
   addnewSeason()
   async {
     var url = Uri.parse('${domin}/api/User/AddSeason');
     print("\n\n\n\nsamy\n\n\n\n");
     var response;
     try
     {
       print("\n\n\n\n in e \n\n\n\n");
       response = await http.post(url,
         headers: <String, String>{
           'Content-Type': 'application/json; charset=UTF-8',
         },
         body: jsonEncode(toJson()),
       );
       print("\n\n\n\n after e \n\n\n\n");

     }catch(e)
     {

       print(e.toString());
     }

     print("\n\n\n\nhassan\n\n\n\n");

     print('Response status: ${response.statusCode}');
     print('Response body: ${response.body}');
     print("\ndata \n\n");
     print(toJson());
   }


   factory Season.fromJson(Map<String, dynamic> json) => Season.load(
 json["season_Id"],
      json["farm_ID"],
      json["date_Beganing"],
    json["crop_Name"],
   );
   static Future<List<Season>>  getSeasons(String id,bool end)
   async {
     String url2;
     if(end)
       {
         print("${domin}/api/User/ShowSeason/${id}/active");

          url2 = "${domin}/api/User/ShowSeason/${id}/active";

       }
     else
       {
         print("${domin}/api/User/ShowSeason/${id}/end");
         url2 = "${domin}/api/User/ShowSeason/${id}/end";
       }



     var response = await http.get(Uri.parse(url2));

     print(response.body);
     List<Season> data= List<Season>.from(json.decode(response.body).map((x) => Season.fromJson(x)));

     print("\n\n\n\n\n lenth = "+data.length.toString());
     return data;
   }





  static Future<List<String>>  getcrops()
   async {

     String url2 = "${domin}/api/User/showCrops";
print(url2);

     var response = await http.get(Uri.parse(url2));

     print(response.body);
     List<String> data= List<String>.from(json.decode(response.body));

     print("\n\n\n\n\n lenth = "+data.length.toString());
     return data;
   }
   endSeason()
   async {

     String url2 = "${domin}/api/User/EndSeason/${this._Season_Id}";
     print(url2);

     var response = await http.get(Uri.parse(url2));

     print(response.body);

   }

}