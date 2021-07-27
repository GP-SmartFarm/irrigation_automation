import 'dart:convert';
import 'dart:ffi';

import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/model/Request.dart';
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

class RequestScreen extends StatefulWidget {
  @override
  _RequestScreenState createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  //Request request = Request();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Image _image; //for image

  @override
  Widget build(BuildContext context) {
    Request request =
        Provider.of<RequestProvider>(context, listen: false).request;
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).appBarTheme.textTheme,
        backgroundColor: Theme.of(context).appBarTheme.color,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        title: Text("طلب التقديم"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isloading,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  "بيانات المستخدم",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FaulNameField((value) {
                        request.user.fullName = value;
                      }),
                      SsnField((value) {
                        request.user.ssn_id = value;
                      }),
                      PhoneField((value) {
                        request.user.phone = value;
                        //  request.user.birthDate.d
                      }),
                      UserNameField((value) {
                        request.user.username = value;
                      }),
                      PassWordField((value) {
                        request.user.password = value;
                      }),
                      ImagePickerWidget(" صورة كارت الفلاح", (value) {
                        request.user.farmerCardImage = value;
                      }),
                      ImagePickerWidget(" صورة البطاقة الامامية", (value) {
                        request.user.nationalCardImageFront = value;
                      }),
                      ImagePickerWidget(" صورة البطاقة الخلفية", (value) {
                        request.user.nationalCardImageBack = value;
                      }),

                    ],
                  ),
                ),
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
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        print("1");
                        await request.addRequest();
                        print("\n\n    done samy");
                        modelHud.changeisloading(false);

                        Navigator.pushNamed(context, AppRoutes.loginRoute);
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
