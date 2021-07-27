import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:irrigation_automation/config/AppRoutes.dart';
import 'package:irrigation_automation/model/Farm.dart';
import 'package:irrigation_automation/model/Season.dart';
import 'package:irrigation_automation/widgtes/Drawer.dart';

class AboutScrean extends StatelessWidget {
  const AboutScrean({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          drawer: MyDrawer(),
          appBar: AppBar(
            textTheme: Theme.of(context).appBarTheme.textTheme,
            backgroundColor: Theme.of(context).appBarTheme.color,
            iconTheme: Theme.of(context).appBarTheme.iconTheme,
            title: Text("حول التطبيق"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25.0),
            child: ListView(
              children: [
                Center(child: Text("فوائد التطبيق",style: TextStyle(fontSize: 35),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "توفير المياة",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        """توفير مياة الرى واجب على كل صاحب ارض بسسب الشح المائى . التطبيق يساعدك على توفير المياة بدون التخصص فى حساب المياة اللازمة للرى . لانه يقوم بحساب الريات بشكل دورى وتلاقائى""",
                        maxLines: 4,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "صحة النبات",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        """يساعدك التطبيق فى متابعة الحالة المحسوبه للمحصول واخبارك بما يحتاج من مياة ورعاية """,
                        maxLines: 4,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ساعات العمل والكفائة ",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        """التطبيق يزيد من كفائة وانتاج كلا من الفلاح والارض لانه يقوم يالرى الذاتى ويقلل من ساعتات العمل المهدرة فى الرى الفائض وايضا يساهم فى تقليل اعباء رعاية الارض على الفلاح""",
                        maxLines: 4,
                      ),
                    )
                  ],
                ),   Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ساعات العمل والكفائة ",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    )
                  ],
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .8,
                          child: Text(
                            """التطبيق يزيد من كفائة وانتاج كلا من الفلاح والارض لانه يقوم يالرى الذاتى ويقلل من ساعتات العمل المهدرة فى الرى الفائض وايضا يساهم فى تقليل اعباء رعاية الارض على الفلاح""",
                            maxLines: 4,
                          ),
                        )
                      ],
                    ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "التطبيق الذكى للرى ",
                      style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .8,
                      child: Text(
                        """ التطبيق ذكى حيث يعمل على حساب الاحتياجات المائية للرى ومواعيد الريات لكل المحاصيل المسجلة من خلال المستخدم  مما يستاعد على كفائة الانتاج وتوفير المياة المهدرة فى الرى من خلال اتبع نظام الرى بالتنقيط, كما يساهم على المزارع متابعة المزرعة عن بعد من حيث العوامل المناخية من خلال المجسات الموجودة فى المزرعة التى تمكنه من تجنب المخاضر المتوقع حدوثها نتيجيت التغيرت المناخية.""",
                        maxLines: 4,
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
