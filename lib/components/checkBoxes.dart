import 'package:claimazon/theme/theme_colors.dart';
import 'package:claimazon/theme/theme_styles.dart';
import 'package:flutter/material.dart';

class SimpleCheckBox extends StatelessWidget {
  final bool isChecked;
  final String? text;
  final Function onChange;

  SimpleCheckBox({
    required this.isChecked,
    required this.onChange,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: ThemeColor.primeryColor),
            child: Checkbox(
              value: isChecked,
              checkColor: Colors.white,
              activeColor: ThemeColor.primeryColor,
              onChanged: (value) => onChange(value),
            ),
          ),
          GestureDetector(
            onTap: () {
              onChange(!this.isChecked);
            },
            child: Text(
              '$text',
              style: ThemeStyles.kLabelStyle,
            ),
          ),
        ],
      ),
    );
  }
}
