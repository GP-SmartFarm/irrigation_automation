import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppValidation_rules.dart';
import 'package:irrigation_automation/model/Request.dart';
import 'package:irrigation_automation/provider/RequestProvider.dart';
import 'package:provider/provider.dart';

class ConfirmPassWordField extends StatelessWidget {


  ConfirmPassWordField();

  @override
  Widget build(BuildContext context) {
    Request request =Provider.of<RequestProvider>(context).request;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType:TextInputType.name,
        validator: (value) => validateConfirmPassword(value,request.user.password),
        obscureText: true,
        cursorColor: Theme.of(context).primaryColor,
       // onSaved: onClick,

        decoration: InputDecoration(
            focusColor: Colors.blue,
            isDense: true,
            filled: true,
            fillColor: Colors.black12,       //color enter back ground field
            labelText: "تأكيد الرقم السرى",
            labelStyle: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 15
            ),
            hintText: "الرقم السرى",
            prefixIcon: Icon(
              Icons.lock_outline_rounded
              ,color: Colors.yellow,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(22),
              borderSide: BorderSide(
                  color: Colors.white
              ), // borderRadius:
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(
                    color: Colors.blue
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(22),
                borderSide: BorderSide(
                    color: Colors.red
                ))
        ),
      ),
    );
  }
}
