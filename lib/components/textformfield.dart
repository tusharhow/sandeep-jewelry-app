import 'package:flutter/material.dart';


class FormFieldComponent extends StatelessWidget {
  const FormFieldComponent({
    Key? key,
    @required this.hintText,
    @required this.icon,
    @required this.controller,
  }) : super(key: key);

  final hintText;
  final icon;
  final controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          ),
      filled: true,
      fillColor: Color(0xff272727),
      hintText: hintText,
      prefixIcon: Image(
        color: Colors.white,
        image: AssetImage(icon),
       
      ),
      hintStyle: TextStyle(
        color: Colors.white,
      )),
    );
  }
}
