import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppValidation_rules.dart';

class UserNameField extends StatelessWidget {
  final Function onClick;

  UserNameField(this.onClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child:TextFormField(
        keyboardType:TextInputType.name,
        validator: (value) => validateUserName(value),
        obscureText: false,
        cursorColor: Theme.of(context).primaryColor,
        onSaved: onClick,
        decoration: InputDecoration(
            focusColor: Colors.blue,
            isDense: true,
            filled: true,
            fillColor: Colors.black12,       //color enter back ground field
            labelText: "ادخل اسم المستخدم",
            labelStyle: TextStyle(
                color: Theme.of(context).primaryColor,
              fontSize: 15
            ),
            hintText: "اسم المستخدم",
            prefixIcon: Icon(
              Icons.account_circle_outlined
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
