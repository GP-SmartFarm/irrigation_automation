import 'dart:convert';

import 'package:flushbar/flushbar.dart';
import 'package:irrigation_automation/provider/modelHud.dart';


import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/config/AppValidation_rules.dart';
import 'package:irrigation_automation/model/User.dart';
import 'package:irrigation_automation/provider/AuthProvider.dart';
import 'package:irrigation_automation/widgtes/AppIcon.dart';
import 'package:irrigation_automation/widgtes/BlockButton.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>  {
  User user= User();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var media;

  Widget _buildUsernameField() {
    return TextFormField(
      decoration: InputDecoration(
        focusColor: Colors.blue,
        labelText:  'الايميل',
      ),
      validator: (value) => validateEmail(value),
      onSaved: (String value) {
        user.username = value;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'الباسورد',
      ),
      validator: (value) => validatePassword(value),
      obscureText: true,
      onSaved: (String value) {
        user.password = value;
      },
    );
  }

  _handleSubmit(BuildContext context, AuthProvider provider) async {
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    modelHud.changeisloading(true);
   // _formKey.currentState.validate()
    if (_formKey.currentState.validate()) {
      // If all data are correct then save data to out variables
    _formKey.currentState.save();

      //Call Auth Provider here...
      await provider.singInWithEmail(user).then((response) {

        if(response != null) {
          Flushbar(
            backgroundColor:
            Theme
                .of(context)
                .colorScheme
                .surface
                .withOpacity(0.8),
            icon: Icon(
              Icons.error_outline,
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
            duration: Duration(seconds: 10),
            flushbarPosition: FlushbarPosition.TOP,
            titleText: Text('هناك خطاء'),
            messageText: Text(response),
          ).show(context);

        }else{
          modelHud.changeisloading(false);
          Navigator.pushReplacementNamed(context, AppRoutes.home);


        }
        modelHud.changeisloading(false);

      });
    }
    modelHud.changeisloading(false);

  }



  @override
  Widget build(BuildContext context) {
    media = MediaQuery.of(context).size;
    var provider = Provider.of<AuthProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        textTheme: Theme.of(context).appBarTheme.textTheme,
        backgroundColor: Theme.of(context).appBarTheme.color,
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        title: Text("تسجيل الدخول"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isloading,
        child: Stack(
          children: [

            Container(
              height: media.height,
              padding: EdgeInsets.only(
                  top: media.height / 20,
                  left: media.height / 20,
                  right: media.height / 20),
              child: Form(
                key: _formKey, //Works with statefull widget
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 80),
                      AppIcon(),
                    //  SizedBox(height: 90,),
                      SizedBox(height: 20.0),
                      _buildUsernameField(),
                      SizedBox(height: 10.0),
                      _buildPasswordField(),
                      SizedBox(height: 40.0),
                      BlockButton(
                        isLoaded: provider.check,
                        color: Theme.of(context).primaryColor,
                        label: 'تسجيل الدخول',
                        textColor: Colors.white,
                        onPressed: () async {
                          await _handleSubmit(context, provider);
                        },
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          FlatButton.icon(
                            icon: Icon(
                              EvilIcons.arrow_right,
                              color: Theme.of(context).primaryColor,
                            ),
                            label: Text('عمل طلب',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context).primaryColor),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.requestScreen,
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
