import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/model/Farm.dart';
import 'package:irrigation_automation/model/Irrigate.dart';
import 'package:irrigation_automation/model/Season.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:irrigation_automation/widgtes/Drawer.dart';



class SeasonDetails extends StatelessWidget {
  const SeasonDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context).settings.arguments as List;
    final elment=arg[0] as Season;
    final flag=arg[1] as bool;
    final farm=arg[2] as Farm;
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          textTheme: Theme.of(context).appBarTheme.textTheme,
          backgroundColor: Theme.of(context).appBarTheme.color,
          iconTheme: Theme.of(context).appBarTheme.iconTheme,
          title: Text("الموسم"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                flag? Text("الموسم الحالى",style:Theme.of(context).accentTextTheme.headline2):
                Text("الموسم السابق",style:Theme.of(context).accentTextTheme.headline2)
              ],
            ),
            CardSeason(context,elment,flag,farm)
            ,
            Expanded(child: IrrigateBuilder(elment.Season_Id.toString())),
          ],
        )
    );
  }
  Widget CardSeason(BuildContext context,Season elment,bool flag,Farm farm)
  {
    var hieght =MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.only(left:20.0,top: 5,right: 20,bottom: 5),
      child: Container(
          height: MediaQuery.of(context).size.height*.2,
          // width: 100,

          child: Card(
              color: Colors.greenAccent,
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
                            Text("النبات "+elment.Crop_Name,style: Theme.of(context).accentTextTheme.headline2,),


                          ],
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(elment.Date_Beganing),
                            !flag?Text("تم الانتهاء"+elment.Crop_Name,style: Theme.of(context).accentTextTheme.headline2,):
                            RaisedButton(color: Colors.blue,child: Text("انتهاء الموسم"),onPressed: () async {
                              await elment.endSeason();
                              Navigator.pop(context,);
                              Navigator.popAndPushNamed(context, AppRoutes.seasonsScrean, arguments: farm);
                            })
                          ],
                        ),
                      ),
                    ]
                ),
              ))),
    );
  }
  Widget IrrigateBuilder(String id) {
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
        if(projectSnap.data.length==0)
          {
            return Center(child: Text("لا يوجد ريات",style: Theme.of(context).accentTextTheme.headline2,));
          }
        List<FlSpot> datas=[];
        for(int i=0;i<projectSnap.data.length;i++)
          {
            datas.add(FlSpot(i+1.0,projectSnap.data[i].quantity));
            /*datas.add(FlSpot(1.0,60.5));
           datas.add(FlSpot(2.0,62.3));
            datas.add(FlSpot(3.0,68.6));
            datas.add(FlSpot(4.0,65.3));
            datas.add(FlSpot(5.0,71.4));
            datas.add(FlSpot(6.0,67.2));
            datas.add(FlSpot(7.0,70.1));
            datas.add(FlSpot(8.0,72.7));
            datas.add(FlSpot(9.0,71.2));*/
          }
        return Container(
          height: MediaQuery.of(context).size.height*.6,
          padding: EdgeInsets.all(10),
          width: double.infinity,
          child: LineChart(LineChartData(
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                    spots:datas
                )
              ]
          ),
          ),
        );
      },
      future: Irrigate.getIrrigates(id),
    );
  }
  Widget CardFarm(BuildContext context,int n)
  {
    var hieght =MediaQuery.of(context).size.height;
    return  Text(n.toString());
  }
}












/*
Widget CardSeason(BuildContext context,Season elment)
  {
    var hieght =MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.only(left:20.0,top: 5,right: 20,bottom: 5),
      child: Container(
        height: MediaQuery.of(context).size.height*.2,
       // width: 100,

        child: Card(
          color: Colors.greenAccent,
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
                     Text("النبات "+elment.Crop_Name,style: Theme.of(context).accentTextTheme.headline2,),

                      RaisedButton(color: Colors.blue,child: Text("انتهاء الموسم"),onPressed: () async {
                        await elment.endSeason();
                      })
                    ],
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Text(elment.Date_Beganing),
                      RaisedButton(color: Colors.blue,child: Text("رياتى"),onPressed: () async {
                        //     await Season.getcrops();
                      })
              ],
            ),
          ),
          ]
        ),
      ))),
    );
  }
 */