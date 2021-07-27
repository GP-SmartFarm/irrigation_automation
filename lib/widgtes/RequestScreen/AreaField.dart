import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:irrigation_automation/config/AppValidation_rules.dart';

class AreaField extends StatelessWidget {
  final Function onClick;

  AreaField(this.onClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        keyboardType:TextInputType.number,
        validator: (value) => validateArea(value),
        obscureText: false,
        cursorColor: Theme.of(context).primaryColor,
        onSaved: onClick,
        decoration: InputDecoration(
            focusColor: Colors.blue,
            isDense: true,
            filled: true,
            fillColor: Colors.black12,       //color enter back ground field
            hintText: "المساحة",
           /* prefixIcon: Icon(
              Icons.accessibility
              ,color: Colors.yellow,
            ),*/
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                  color: Colors.white
              ), // borderRadius:
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: Colors.blue
                )),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                    color: Colors.red
                ))
        ),
      ),
    );
  }
}
