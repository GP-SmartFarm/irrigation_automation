import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/constants.dart';
import 'package:irrigation_automation/model/User.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier
{

  bool isLoaded = false;
  bool isLoadeduser = false;
  bool _isLoggedIn = false;
  bool check = true;
 String id;
  User user;


  AuthProvider()
  {
    autoAuthenticate();
  }
  bool get isLoggedIn => _isLoggedIn;

  Future<void> getCurrentUser() async {
    var response;
    if(!isLoadeduser) {
      try {
        print("\n\nhassen \n\n${domin}/api/User/UserInfo/${id}");
        String url2 =
            "${domin}/api/User/UserInfo/${id}";


        var response = await http.get(Uri.parse(url2));
        print(response.body);
        List<User> data = List<User>.from(
            json.decode(response.body).map((x) => User.fromJson(x)));
        user = data[0];
        print(data[0].fullName);
        print("user " + data.length.toString());
      } catch (error) {
        print(error);
      }

      isLoadeduser = true;

      notifyListeners();
    }
  }









  Future<String> singInWithEmail(User user) async {
    isLoaded = false;
    String errorMsg;
    var response;

    try {
      print("${domin}/api/User/login/${user.username}/${user.password}");
      String url2 =
          "${domin}/api/User/login/${user.username}/${user.password}";




      var response = await http.get(Uri.parse(url2));
      if(response.body=="User Name or Password is Wrong")
      {
        print('Wrong');
        errorMsg = "User Name or Password is Wrong";
        _isLoggedIn = false;

      }
      else

      {
        id=response.body;
        _isLoggedIn = true;
        print("logon"+id);
        set_User();

      }


    }  catch (error) {
      print(error);
    }

    //isLoaded = true;
    print("\n error message");
print(errorMsg);
    notifyListeners();
    return errorMsg;
  }

  Future<void> set_User()
  async {
    final _prefs = await SharedPreferences.getInstance();

    _prefs.setString('id',id );
    _isLoggedIn = true;

    notifyListeners();
  }


/*
 * Auth Authenticate
 *
 * Auto authentication help to get user data from shared preferences
 * and save as user user object. which can be access anywhere
 * in the app.
 *
 * please check page-user-account.dart for example
 *
 */

  Future autoAuthenticate() async {

    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    id = _prefs.getString('id');
print("\n\n\n\nid ="+id+"\n\n\n\n");
    if (id != null) {
      _isLoggedIn = true;
    }
    print("\n\n\n\nid ="+_isLoggedIn.toString()+"\n\n\n\n");

    isLoaded = true;

    notifyListeners();
  }

  /*
  * Logout
  *
  * Clear user preference & user
  */



  void logout() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    id = null;
    _prefs.clear();
    _isLoggedIn = false;
    notifyListeners();
  }


}


//https://intelligencefarmers.azurewebsites.net/api/User/login/samy sabry/123456789
// function Login


//https://intelligencefarmers.azurewebsites.net/api/User/UserInfo/2
// function user info