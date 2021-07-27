import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/model/Farm.dart';
import 'package:irrigation_automation/model/Season.dart';
import 'package:irrigation_automation/widgtes/Drawer.dart';

class PreviousSeasons extends StatelessWidget {
  const PreviousSeasons({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(

        drawer: MyDrawer(),

        appBar: AppBar(
          textTheme: Theme.of(context).appBarTheme.textTheme,
          backgroundColor: Theme.of(context).appBarTheme.color,
          iconTheme: Theme.of(context).appBarTheme.iconTheme,
          title: Text("المواسم"),
        ),
        body: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("المواسم السابقة",style:Theme.of(context).accentTextTheme.headline1 ,)
              ],
            ),
            Expanded(child: FarmBuilderprevious(id))

          ],
        )
    );
  }
  Widget FarmBuilderprevious(String id) {
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
        return ListView.builder(
          itemCount: projectSnap.data.length,
          itemBuilder: (context, index) {
            Season elment = projectSnap.data[index];
            return CardSeasonprevious(context,elment);
          },
        );
      },
      future: Season.getSeasons(id,false),
    );
  }
  Widget CardSeasonprevious(BuildContext context,Season elment)
  {
    var hieght =MediaQuery.of(context).size.height;
    return  Padding(
      padding: const EdgeInsets.only(left:20.0,top: 5,right: 20,bottom: 5),
      child: GestureDetector(
        onTap: (){
          Navigator.pushNamed(
              context,
              AppRoutes.seasonDetails,
              arguments: [elment,false,Farm()]
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
      ),
    );
  }
}
