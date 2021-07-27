import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_map_location_picker/generated/l10n.dart' as location_picker;
import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppProvider.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/config/AppTheme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProvider().providers(),
      child: MaterialApp(

        localizationsDelegates: const [
          location_picker.S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const <Locale>[
          Locale('ar', ''),
          //Locale('en', 'US')
        ],
        debugShowCheckedModeBanner: false,
        title: 'Irrigation Automation',
        theme:AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        routes: AppRoutes().routes(),
        initialRoute: AppRoutes.home,

      ),
    );
  }
}


//irrigate-311722
//AIzaSyBw1WUQtQy3A0Tz34h38CTjavcRisUJiEg

//search   AIzaSyBDcDUoRLMQqyF3Qobuto6U14RKhRqaNRY
//https://www.youtube.com/watch?v=3hiT9tlWipE  for address problem

// AIzaSyAXhk1498g30RPHcP6Wytkouh0Mn28obVo



//for drop down
// ttps://stackoverflow.com/questions/52926335/how-validate-dropdown-in-flutterh
// https://gitlab.com/Patesz/dropdown_datepicker/-/blob/master/lib/src/dropdown_date_picker.dart


//192.168.1.5
//192.168.247.1
//192.168.253.1

//https://192.168.247.1:44371/api/User/Getdata


//https://localhost:44371/api/User/Post



//for level on sea     https://maps.googleapis.com/maps/api/elevation/json?locations=39.7391536,-104.9847034&key=AIzaSyBw1WUQtQy3A0Tz34h38CTjavcRisUJiEg