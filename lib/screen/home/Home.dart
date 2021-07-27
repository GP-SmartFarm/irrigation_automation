import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/model/Farm.dart';
import 'package:irrigation_automation/model/User.dart';
import 'package:irrigation_automation/provider/AuthProvider.dart';
import 'package:irrigation_automation/widgtes/Drawer.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/ConfirmPassWordField.dart';
import 'package:irrigation_automation/widgtes/home/HumidityWidgit.dart';
import 'package:irrigation_automation/widgtes/home/TempratureWidget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var us = Provider.of<AuthProvider>(context);
   var hieght= MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
         // print(Farm.getFarms('2'));
         Navigator.pushNamed(context, AppRoutes.addFarmScreen);
          us.getCurrentUser();
        },
        label: const Text('اضافة مزرعة'),

        icon: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      drawer: MyDrawer(),
      appBar: AppBar(
        textTheme: Theme.of(context).appBarTheme.textTheme,
        backgroundColor: Theme.of(context).appBarTheme.color,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        title: Text("مزرعتى"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FarmBuilder(us.id)
      ),
    );
  }
  Widget FarmBuilder(String id) {
    return FutureBuilder(
      builder: (context, projectSnap) {

        if (projectSnap.connectionState == ConnectionState.none ||
            projectSnap.hasData == null||projectSnap.connectionState==ConnectionState.waiting) {
          //print('project snapshot data is: ${projectSnap.data}');
          return Container(child: Center(
            child: CircularProgressIndicator(
          //    value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            )));
        }
        if(projectSnap.data==null)
        {
          return Center(child: Text("لا يوجد مزارع "),);
        }
        return Padding(
          padding: const EdgeInsets.only(bottom :55.0),
          child: ListView.builder(
            itemCount: projectSnap.data.length,
            itemBuilder: (context, index) {
              Farm elment = projectSnap.data[index];
              return CardFarm(context,elment);
            },
          ),
        );
      },
      future: Farm.getFarms(id),
    );
  }
  Widget CardFarm(BuildContext context,Farm elment)
  {
    var hieght =MediaQuery.of(context).size.height;
    return  Container(
      height: hieght*0.45,

      child: GestureDetector(
        child: Card(
          shadowColor: Colors.black,
          elevation:8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TempratureWidget(elment.sensor.temperature),
                      HumidtityWidget(elment.sensor.humidity),
                    ],
                  ),
                ),
                Expanded( child:  Container(decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12,width: 2)
                ), child: Image.memory(base64Decode(elment.hisimage),


                ),

                )),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined,size: 40,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(elment.region,style:Theme.of(context).accentTextTheme.headline1,textScaleFactor: 0.7,),
                              Text(elment.governorate,style:Theme.of(context).accentTextTheme.headline1,),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [

                          Text(" ${elment.area} متر",style:Theme.of(context).accentTextTheme.headline2,),
                          Text("تربة ${elment.type_soil}",style:Theme.of(context).accentTextTheme.headline2,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: (){
          Navigator.pushNamed(context, AppRoutes.seasonsScrean, arguments: elment,);
        },
      ),
    );
  }
}
