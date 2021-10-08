import 'package:claimazon/theme/theme_styles.dart';
import 'package:flutter/material.dart';

class RoundedShapeButton extends StatelessWidget {
  final String? title;
  final Function onClick;
  final Color? bgColor;
  final TextStyle? textStyle;
  RoundedShapeButton(
      {this.title, required this.onClick, this.bgColor, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        elevation: 0.0,
        onPressed: () {
          onClick();
        },
        padding: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: bgColor ?? Colors.white,
        child: Text(
          '${title ?? ''} ',
          style: textStyle ?? ThemeStyles.kLabelStyle,
        ),
      ),
    );
  }
}
