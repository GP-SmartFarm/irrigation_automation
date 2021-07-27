

import 'dart:io';

class User {
  String _fullName;
  String _ssn_id;
  String _phone;
  String _id;//="dd"
  String _username;   //replace email by this
  String _password;

  String get id => _id;

  set id(String value) {
    _id = value;
  } //String _email;

 // DateTime _birthDate;//delete
  File _nationalCardImageFront;
  File _nationalCardImageBack;
  File _farmerCardImage;

  String get username => _username;

  set username(String value) {
    _username = value;
  } // int _day;
  //int _month;
//
  //int get day => _day;




  User.r(this._ssn_id, this._fullName, this._phone,
      this._nationalCardImageFront, this._nationalCardImageBack,
      this._farmerCardImage);


  User();

  User.s(this._fullName,this._username);

  String get password => _password;

  set password(String value) {
    _password = value;
  }






  String get fullName => _fullName;

  set fullName(String value) {
    _fullName = value;
  }

  static User fromJson(Map<String, dynamic> json)
  {
    return User.s(
      json['full_Name'] as String,
      json['user_Name'] as String,
    );
  }

  set ssn_id(String value) {
    _ssn_id = value;
  }

  String get ssn_id => _ssn_id;

  Map<String, dynamic> toJson()
  {
    return {
      'id': this.id,
      'firstName': this.fullName,

    };
  }

  set phone(String value) {
    _phone = value;
  }

  set farmerCardImage(File value) {
    _farmerCardImage = value;
  }

  set nationalCardImageBack(File value) {
    _nationalCardImageBack = value;
  }

  set nationalCardImageFront(File value) {
    _nationalCardImageFront = value;
  }







  String get phone => _phone;


  File get farmerCardImage => _farmerCardImage;

  File get nationalCardImageBack => _nationalCardImageBack;

  File get nationalCardImageFront => _nationalCardImageFront;


}
