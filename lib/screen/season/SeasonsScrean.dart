import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/model/Farm.dart';
import 'package:irrigation_automation/model/Season.dart';
import 'package:irrigation_automation/model/Sensor.dart';
import 'package:irrigation_automation/widgtes/Drawer.dart';
import 'package:irrigation_automation/widgtes/home/HumidityWidgit.dart';
import 'package:irrigation_automation/widgtes/home/TempratureWidget.dart';

class SeasonsScrean extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final elment = ModalRoute.of(context).settings.arguments as Farm;

    return Scaffold(

      drawer: MyDrawer(),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
               FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      AppRoutes.addSeasonScreen,
                      arguments: elment
                  );
                },


                label: const Text('اضافة موسم'),

                icon: const Icon(Icons.add),
                backgroundColor: Colors.green,
              ),
               FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      AppRoutes.previousSeasons,
                      arguments: elment.id
                  );
                },


                label: const Text('المواسم السابقة'),

                icon: const Icon(Icons.settings_backup_restore_rounded),
                backgroundColor: Colors.green,
              ),
            ],
          ),
        ),
      appBar: AppBar(
        textTheme: Theme.of(context).appBarTheme.textTheme,
        backgroundColor: Theme.of(context).appBarTheme.color,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        title: Text("مزرعتى"),
      ),
      body: Column(
        children: [
          Card(
            color: Colors.white54,
            shadowColor: Colors.black,
            elevation:8,
            shape: RoundedRectangleBorder(
           //   borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*.35,
              //  color: Colors.white54,
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("الموسم الحالى",style:Theme.of(context).accentTextTheme.headline2)
            ],
          ),
          Expanded(child: FarmBuilderCurent(elment)),
        ],
      )
    );


  }


  Widget FarmBuilderCurent(Farm farm) {

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
        if (projectSnap.data==null)
        {
          return Center(child: Text("لا يوجد مواسم"));
        }
        if(projectSnap.hasError) {
          Container(child: Center(
              child: CircularProgressIndicator(
                //    value: controller.value,
                semanticsLabel: 'Linear progress indicator',
              )));
        }

        return ListView.builder(
          itemCount: projectSnap.data.length,
          itemBuilder: (context, index) {
            Season elment = projectSnap.data[index];
            return CardSeason(context,elment,farm);
          },
        );
      },
      future: Season.getSeasons(farm.id,true),
    );
  }
  Widget CardSeason(BuildContext context,Season elment,Farm farm)
  {
    var hieght =MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: Container(
        height: MediaQuery.of(context).size.height*.07,
       // width: 100,

        child: GestureDetector(
          onTap: (){
            Navigator.pushNamed(
                context,
                AppRoutes.seasonDetails,
                arguments: [elment,true,farm]
            );
          },
          child: Card(
            color: Colors.white54,
            shadowColor: Colors.black,
            elevation:8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10,),
              child: Text("  نبات "+elment.Crop_Name,style: Theme.of(context).accentTextTheme.headline2,),
            )),
        )),
    );
  }

 
}


