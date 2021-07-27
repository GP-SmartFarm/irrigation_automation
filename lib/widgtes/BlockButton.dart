import 'package:flutter/material.dart';

import 'CustomCircularProgressIndicator.dart';

class BlockButton extends StatelessWidget {
  final String label;
  final Color textColor;
  final Color color;
  final double radius;
  final bool isLoaded;
  final Function onPressed;

  BlockButton({
    this.label,
    this.color,
    this.textColor,
    this.onPressed,
    this.radius,
    isLoaded,
  }) : isLoaded = isLoaded ?? true;
  @override
  Widget build(BuildContext context) {
    double _radius = radius != null ? radius : 2;
    return isLoaded
        ? Container(
            width: double.infinity,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_radius)),
              onPressed: () => onPressed(),
              child: Padding(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 14.0, color: textColor),
                ),
                padding: EdgeInsets.all(15.0),
              ),
              color: color,
            ),
          )
        : CustomCircularProgressIndicator();
  }
}
