






import 'package:flutter/material.dart';
import 'package:irrigation_automation/provider/AuthProvider.dart';
import 'package:provider/provider.dart';
class UserWidgit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var us = Provider.of<AuthProvider>(context);
    return FutureBuilder(
            builder: (context, projectSnap) {
        if (projectSnap.connectionState == ConnectionState.none ||
        projectSnap.hasData == null||projectSnap.connectionState==ConnectionState.waiting) {
        //print('project snapshot data is: ${projectSnap.data}');
        return UserAccountsDrawerHeader(accountName: Text("تحميل",style: Theme.of(context).accentTextTheme.headline1), //accountEmail: Text(us.user.fullName,style: Theme.of(context).accentTextTheme.headline2,),
            //    currentAccountPicture: CircleAvatar(child:Icon(Icons.person)),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              //image:DecorationImage(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg"),fit: BoxFit.fill)
            ));
        }

        return  UserAccountsDrawerHeader(accountName: Text(us.user.username,style: Theme.of(context).accentTextTheme.headline1),
          accountEmail: Text(us.user.fullName,style: Theme.of(context).accentTextTheme.headline2,),
      //    currentAccountPicture: CircleAvatar(child:Icon(Icons.person)),
          decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          //image:DecorationImage(image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/e/e1/FullMoon2010.jpg"),fit: BoxFit.fill)
          ));
          },
        future: us.getCurrentUser(),
        );

  }
}





