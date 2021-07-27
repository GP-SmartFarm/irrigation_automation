import 'package:irrigation_automation/provider/AuthProvider.dart';
import 'package:irrigation_automation/provider/RequestProvider.dart';
import 'package:irrigation_automation/provider/modelHud.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AppProvider
{
  List<SingleChildWidget> providers()
  {
    return [
      ChangeNotifierProvider<AuthProvider>(
          create: (_)=> AuthProvider()),
      ChangeNotifierProvider<RequestProvider>(
          create: (_)=> RequestProvider()),
      ChangeNotifierProvider<ModelHud>(
          create: (_)=> ModelHud())
    ];
  }
}