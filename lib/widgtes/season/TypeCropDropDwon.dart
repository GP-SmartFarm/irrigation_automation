import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppValidation_rules.dart';
class TypeCropDropDown extends StatefulWidget {
  final Function onClick;
   List<String> data;
  TypeCropDropDown( this.data,this.onClick,);

  @override
  _TypeCropDropDownState createState() => _TypeCropDropDownState(onClick,data);
}

/// This is the private State class that goes with MyStatefulWidget.
class _TypeCropDropDownState extends State<TypeCropDropDown> {
  final Function onClick;
  String dropdownValue;
  List<String> data;

  _TypeCropDropDownState(this.onClick,this.data)
  {
    dropdownValue=data[0];
    print("data lenth"+data.length.toString());
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

        items: data
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




