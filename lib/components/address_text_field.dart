import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({
    Key? key,
    required this.hint,
    required this.controller,
  }) : super(key: key);
  final hint;
  final controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: MediaQuery.of(context).size.width / 1.10,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a valid address';
          }
          return null;
        },
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }
}
