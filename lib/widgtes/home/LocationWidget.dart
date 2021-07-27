import 'package:flutter/material.dart';

class LoctionWidget extends StatelessWidget {
  String govervment;
  String rigion;

  LoctionWidget(this.govervment, this.rigion);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "loc",
          style: Theme.of(context).accentTextTheme.headline1,
        ),
  Column(
    children: [
      Text(govervment, style: Theme.of(context).accentTextTheme.headline1,),
      Text(rigion, style: Theme.of(context).accentTextTheme.headline1,),
    ],
  )
      ],
    );
  }
}
