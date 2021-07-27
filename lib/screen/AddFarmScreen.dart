import 'dart:convert';
import 'dart:ffi';

import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/model/Request.dart';
import 'package:irrigation_automation/provider/AuthProvider.dart';
import 'package:irrigation_automation/provider/RequestProvider.dart';
import 'package:irrigation_automation/provider/modelHud.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/AreaField.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/BirthDayDropDown.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/ConfirmPassWordField.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/FaulNameField.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/ImagePickerWidget.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/MapWidget.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/PassWordField.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/PhoneField.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/SsnField.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/TypeSoilDropDown.dart';
import 'package:image_picker/image_picker.dart';
import 'package:irrigation_automation/widgtes/RequestScreen/UserNameField.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddFarmScreen extends StatefulWidget {
  @override
  _AddFarmScreenState createState() => _AddFarmScreenState();
}

class _AddFarmScreenState extends State<AddFarmScreen> {
  //Request request = Request();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  Image _image; //for image

  @override
  Widget build(BuildContext context) {
    Request request =
        Provider.of<RequestProvider>(context, listen: false).request;
    var person = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).appBarTheme.textTheme,
        backgroundColor: Theme.of(context).appBarTheme.color,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        title: Text("طلب اضافة مزرعة"),
      ),
      body:ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isloading,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child:
            ListView(
              children: [
                Text(
                  "بيانات الحقل",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                //data of farm
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("مساحة الحقل بالمتر"),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: AreaField((value) {
                                request.farm.area = double.parse(value);
                              }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text("نوع التربة"),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: TypeSoilDropDown((value) {
                                request.farm.type_soil = value;
                              }),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RaisedButton(
                          child: Text("حدد موقعك"),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.mapScreen,
                            );
                          },
                        ),
                      ),
                      ImagePickerWidget("اختار صورة الحقل", (value) {
                        request.farm.image = value;
                      }),
                    ],
                  ),
                ),

                ButtonTheme(
                  height: MediaQuery.of(context).size.height * .1,
                  minWidth: MediaQuery.of(context).size.width,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "ارسال الطلب",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    onPressed: () async {
                      final modelHud = Provider.of<ModelHud>(context, listen: false);
                      modelHud.changeisloading(true);
                      //    _formKey.currentState.validate()
                      if (_formKey.currentState.validate())
                      {
                        _formKey.currentState.save();
                        //print("1");
                        request.user.id=person.id;
                        await request.addRequestnewFarm();
                        print("\n\n    done samy");
                        modelHud.changeisloading(false);

                        Navigator.pop(context,);
                        Navigator.popAndPushNamed(context, AppRoutes.home);
                      }
                      modelHud.changeisloading(false);

                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
