import 'package:flutter/material.dart';

class AddressConfirmation extends StatefulWidget {
  AddressConfirmation({Key? key}) : super(key: key);

  @override
  _AddressConfirmationState createState() => _AddressConfirmationState();
}

class _AddressConfirmationState extends State<AddressConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          height: 150,
          width: 300,
          color: Colors.white10,
        ),
      ]),
    ));
  }
}
