import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppValidation_rules.dart';

class PassWordField extends StatefulWidget {
  final Function onClick;

  PassWordField(this.onClick);

  @override
  _PassWordFieldState createState() => _PassWordFieldState();
}

class _PassWordFieldState extends State<PassWordField> {
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            controller: _password,
            keyboardType:TextInputType.name,
            validator: (value) => validatePassWord(value),
            obscureText: true,
            cursorColor: Theme.of(context).primaryColor,
            onSaved: widget.onClick,

            decoration: InputDecoration(
                focusColor: Colors.blue,
                isDense: true,
                filled: true,
                fillColor: Colors.black12,       //color enter back ground field
                labelText: "ادخل الرقم السرى",
                labelStyle: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 15
                ),
                hintText: "الرقم السرى",
                prefixIcon: Icon(
                  Icons.lock_outlined
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
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextFormField(
            keyboardType:TextInputType.name,
            validator: (value) => validateConfirmPassword(value,_password.text),
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
                  Icons.lock_outlined
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
        )
      ],
    );
  }
}
