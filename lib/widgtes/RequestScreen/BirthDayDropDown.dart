import 'package:flutter/material.dart';
class BirthDayDropDown extends StatefulWidget {
  final Function onClickDay;
  final Function onClickMonth;
  final Function onClickYear;

  BirthDayDropDown(this.onClickDay, this.onClickMonth, this.onClickYear);

  @override
  _BirthDayDropDownState createState() => _BirthDayDropDownState(onClickDay,onClickMonth,onClickYear);
}

/// This is the private State class that goes with MyStatefulWidget.
class _BirthDayDropDownState extends State<BirthDayDropDown> {
  final Function onClickDay;
  final Function onClickMonth;
  final Function onClickYear;
  String dropdownValueDay;
  String dropdownValueMonth;
  String dropdownValueyear;
  static final now = DateTime.now();


  _BirthDayDropDownState(this.onClickDay, this.onClickMonth, this.onClickYear);



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Day(1,30),
        Month(1,12),
        Year(now.year-100,now.year)
      ],
       );
  }

  Widget Day(int min,int max)
  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButton<String>(
     //   value:dropdownValue ,
        hint: dropdownValueDay!=null?Text(dropdownValueDay):Text('اليوم'),
       // icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),

        onChanged: (newValue) {
          onClickDay(int.parse(newValue));
          setState(() {
            dropdownValueDay = newValue;
          });
        },
        items: [for(int i=min;i<=max;i+=1) i]
            .map<DropdownMenuItem<String>>((int value) {
          return DropdownMenuItem<String>(
            value: value.toString(),
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );

  }

  Widget Month(int min,int max)
  {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButton<String>(
        //   value:dropdownValue ,
        hint: dropdownValueyear!=null?Text(dropdownValueyear):Text('الشهر'),
        // icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),

        onChanged: (newValue) {
          onClickMonth(int.parse(newValue));
          setState(() {
            dropdownValueyear = newValue;
          });
        },
        items: [for(int i=min;i<=max;i+=1) i]
            .map<DropdownMenuItem<String>>((int value) {
          return DropdownMenuItem<String>(
            value: value.toString(),
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );

  }

  Widget Year(int min,int max)
  {
    return FormField<String>(
        validator: (value) {
      if (value == null) {
        return "Select your area";
      }
    },
    onSaved: (value) {
      onClickYear(int.parse(value));

    },
  builder: (
  FormFieldState<String> state,
    ) {
  return
  Padding(
  padding: const EdgeInsets.all(10.0),
  child: DropdownButton<String>(
  //   value:dropdownValue ,
  hint: dropdownValueMonth!=null?Text(dropdownValueMonth):Text('العام'),
  // icon: const Icon(Icons.arrow_downward),
  iconSize: 24,
  elevation: 16,
  style: const TextStyle(color: Colors.deepPurple),
  underline: Container(
  height: 2,
  color: Colors.deepPurpleAccent,
  ),

  onChanged: (newValue) {
  onClickYear(int.parse(newValue));
  setState(() {
  dropdownValueMonth = newValue;
  });
  },
  items: [for(int i=max;i>=min;i-=1) i]
      .map<DropdownMenuItem<String>>((int value) {
  return DropdownMenuItem<String>(
  value: value.toString(),
  child: Text(value.toString()),
  );
  }).toList(),
  ),
  );
  });

  }


}
