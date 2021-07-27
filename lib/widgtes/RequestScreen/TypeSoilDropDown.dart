import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppValidation_rules.dart';
class TypeSoilDropDown extends StatefulWidget {
  final Function onClick;

  TypeSoilDropDown(this.onClick);

  @override
  _TypeSoilDropDownState createState() => _TypeSoilDropDownState(onClick);
}

/// This is the private State class that goes with MyStatefulWidget.
class _TypeSoilDropDownState extends State<TypeSoilDropDown> {
  final Function onClick;
  String dropdownValue="طينية";

  _TypeSoilDropDownState(this.onClick)
  {
    onClick(dropdownValue);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),

        onChanged: (newValue) {
          onClick(newValue);
          setState(() {
            dropdownValue = newValue;
          });
        },

        items: <String>['طينية', 'رملية']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}




