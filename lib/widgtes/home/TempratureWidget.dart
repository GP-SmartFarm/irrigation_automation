import 'package:flutter/material.dart';

class TempratureWidget extends StatelessWidget {
  int value;

  TempratureWidget(this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "C °",
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
