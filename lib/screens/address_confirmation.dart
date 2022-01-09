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
      body: Center(
        child: Text('Address Confirmation'),
      ),
    );
  }
}
