import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/provider/AuthProvider.dart';
import 'package:provider/provider.dart';

import 'drawer/User.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider user =
        Provider.of<AuthProvider>(context, listen: false);
    return Drawer(
      child: ListView(
        children: [
          UserWidgit(),
          ListTile(
            title: Text("الصفحة الرئيسية", style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.home, size: 25),
            onTap: () {
              Navigator.popUntil(context,ModalRoute.withName(AppRoutes.home));

            },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("الطلبات", style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.videogame_asset),
            onTap: () {
           //   Navigator.
    Navigator.pushNamed(context, AppRoutes.requestsFarm);},
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("حول التطبيق", style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.info_outline),
            onTap: () {
    Navigator.pushNamed(context, AppRoutes.aboutScrean



    );

  },
          ),
          Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text("تسجيل خروج",
                style: TextStyle(fontSize: 18)),
            leading: Icon(Icons.remove_circle),
            onTap: () {
              user.logout();
              Navigator.popUntil(context,ModalRoute.withName(AppRoutes.home));
              Navigator.pushReplacementNamed(context, AppRoutes.loginRoute);},
          ),
          Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
