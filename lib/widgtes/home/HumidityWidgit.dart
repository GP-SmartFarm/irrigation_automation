import 'package:flutter/material.dart';

class HumidtityWidget extends StatelessWidget {
  int value;

  HumidtityWidget(this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "RH",
          style: Theme.of(context).accentTextTheme.headline1,
        ),
        Text(
          "%",
          style: Theme.of(context).accentTextTheme.headline1,
        ),
        Text(
          "${value}",
          style: Theme.of(context).accentTextTheme.headline1,
        )
      ],
    );
  }
}
