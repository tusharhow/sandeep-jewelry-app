import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/address_text_field.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/models/address_confirmation_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddressConfirmation extends StatefulWidget {
  AddressConfirmation({Key? key}) : super(key: key);

  @override
  _AddressConfirmationState createState() => _AddressConfirmationState();
}

class _AddressConfirmationState extends State<AddressConfirmation> {
  var addressResponse;
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _regionController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  Future<AddressConfirmationModel> addressConfirmation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    var url = 'https://admin.sandeepjewellers.com/app/public/api/user/address';

    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    }, body: {
      "first": _firstnameController.text,
      "last": _lastnameController.text,
      "country": _countryController.text,
      "address": _addressController.text,
      "pincode": _pincodeController.text,
      "city": _cityController.text,
      "region": _regionController.text,
      "mobileno": _mobileController.text,
    });

    if (response.statusCode == 200) {
      setState(() {
        var parsedData = json.decode(response.body);
        addressResponse = AddressConfirmationModel.fromJson(parsedData);
      });
    } else {
      print('failed to get data');
    }
    return addressResponse;
  }

  GlobalKey<FormState> _keyState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text('Address Confirmation'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(children: [
              Center(
                child: Form(
                    child: Column(
                  children: [
                    AddressTextField(
                      controller: _firstnameController,
                      hint: 'First Name',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AddressTextField(
                      controller: _lastnameController,
                      hint: 'Last Name',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AddressTextField(
                      controller: _mobileController,
                      hint: 'Mobile No',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AddressTextField(
                      controller: _countryController,
                      hint: 'Country',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AddressTextField(
                      controller: _addressController,
                      hint: 'Address',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AddressTextField(
                      controller: _pincodeController,
                      hint: 'Pin Code',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AddressTextField(
                      controller: _cityController,
                      hint: 'City',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AddressTextField(
                      controller: _regionController,
                      hint: 'Region',
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 50,
              ),
              ReusablePrimaryButton(
                  childText: 'Process Order',
                  buttonColor: Colors.amber,
                  textColor: Colors.black,
                  onPressed: () {
                    addressConfirmation();
                    print('Cliced');
                  }),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ));
  }
}
