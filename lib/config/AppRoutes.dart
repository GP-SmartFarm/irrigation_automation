/*
 * AppRoutes
 * 
 * Define all routes for our app. We can access route
 * name as [AppRoutes.myRouteName]  anywhere in our app
 * Add or remove routes according to your requiremnts
 *  
 */

import 'package:flutter/material.dart';
import 'package:irrigation_automation/auth/LoginScreen.dart';
import 'package:irrigation_automation/screen/AddFarmScreen.dart';
import 'package:irrigation_automation/screen/auth/RequestScreen.dart';
import 'package:irrigation_automation/screen/auth/MapScreen.dart';
import 'package:irrigation_automation/screen/auth/Home.dart';
import 'package:irrigation_automation/screen/home/Home.dart';
import 'package:irrigation_automation/screen/home/RequetsFarm.dart';
import 'package:irrigation_automation/screen/season/AboutScrean.dart';
import 'package:irrigation_automation/screen/season/AddSeason.dart';
import 'package:irrigation_automation/screen/season/PreviousSeason.dart';
import 'package:irrigation_automation/screen/season/SeasonDetails.dart';
import 'package:irrigation_automation/screen/season/SeasonsScrean.dart';
import 'package:irrigation_automation/widgtes/commen/AuthCheck.dart';

class AppRoutes {
//  static const registerRoute = 'registerRoute';   //you should care about name lowercase to handel error
  static const loginRoute = 'loginRoute';
  static const home = 'Home';
  static const requestScreen = 'RequestScreen';
  static const mapScreen = 'MapScreen';
  static const addFarmScreen = 'AddFarmScreen';
  static const seasonsScrean = 'SeasonsScrean';
  static const addSeasonScreen = 'AddSeasonScreen';
  static const requestsFarm = 'RequestsFarm';
  static const previousSeasons = 'PreviousSeasons';
  static const seasonDetails = 'SeasonDetails';
  static const aboutScrean = 'AboutScrean';

  Map<String, WidgetBuilder> routes() {
    return {
      requestScreen: (context) => RequestScreen(),
      loginRoute: (context) => LoginScreen(),
      home: (context) => AuthCheck(
            child: HomeScreen(),
            redirect: LoginScreen(),
          ),
      mapScreen: (context) => MapScreen(),
      addFarmScreen: (context) => AddFarmScreen(),
      seasonsScrean: (context) => SeasonsScrean(),
      addSeasonScreen: (context) => AddSeasonScreen(),
      requestsFarm: (context) => RequestsFarm(),
      previousSeasons: (context) => PreviousSeasons(),
      seasonDetails: (context) => SeasonDetails(),
      aboutScrean: (context) => AboutScrean(),
    };
  }
}
