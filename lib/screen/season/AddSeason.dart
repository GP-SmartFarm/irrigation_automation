
import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/model/Farm.dart';
import 'package:irrigation_automation/model/Season.dart';

import 'package:irrigation_automation/provider/modelHud.dart';

import 'package:irrigation_automation/widgtes/season/TypeCropDropDwon.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:provider/provider.dart';

class AddSeasonScreen extends StatefulWidget {
  @override
  _AddSeasonScreenState createState() => _AddSeasonScreenState();
}

class _AddSeasonScreenState extends State<AddSeasonScreen> {
  Season season = Season();
  @override
  Widget build(BuildContext context) {
    final farm = ModalRoute.of(context).settings.arguments as Farm;

    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).appBarTheme.textTheme,
        backgroundColor: Theme.of(context).appBarTheme.color,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        title: Text("اضافة موسم جديد"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isloading,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:FarmBuilder(farm)
        ),
      ),
    );
  }



  Widget FarmBuilder(Farm farm) {
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
        return projectSnap.data!=null? Column(
          children: [
            Row(
              children: [
                Text("نوع التربة"),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child:TypeCropDropDown(projectSnap.data,(value) {
                    season.Crop_Name = value;
                    season.Farm_ID=int.parse(farm.id);
                  }) ,
                ),
              ],
            ),
            RaisedButton(child: Text("اضافة"),onPressed: (){
              final modelHud = Provider.of<ModelHud>(context, listen: false);
              modelHud.changeisloading(true);
       season.addnewSeason();
              modelHud.changeisloading(false);

              Navigator.pop(context,);
              Navigator.popAndPushNamed(context, AppRoutes.seasonsScrean, arguments: farm);
            })
          ],
        ):Center(child: Text("لا يوجد نباتات لاختيارها")) ;
      },
      future: Season.getcrops(),
    );
  }
 //projectSnap.data



}


