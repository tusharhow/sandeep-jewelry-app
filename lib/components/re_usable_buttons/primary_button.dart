import 'package:flutter/material.dart';


class ReusablePrimaryButton extends StatelessWidget {
    ReusablePrimaryButton(
      {required this.childText,
      required this.buttonColor,
      required this.textColor,
      required this.onPressed});

  final String childText;
  final Color buttonColor;
  final Function onPressed;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width / 1.20,
        height: 50,
        color: buttonColor,
        child: Text(
          childText,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 18.0, color: textColor),
        ),
        onPressed: onPressed as void Function(),
      ),
    );
  }
}
