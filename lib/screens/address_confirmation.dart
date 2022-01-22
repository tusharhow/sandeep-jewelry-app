import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sandeep_jwelery/components/address_text_field.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/models/add_order_model.dart';
import 'package:sandeep_jwelery/models/address_confirmation_model.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:sandeep_jwelery/models/total_amount_model.dart';
import 'package:sandeep_jwelery/screens/checkout_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../config.dart';

// ignore: must_be_immutable
class AddressConfirmation extends StatefulWidget {
  AddressConfirmation({Key? key, required this.prodId}) : super(key: key);
  var prodId;
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

  var cartData;
  var totAmount;
  var progId;
  var onclick;
  Future<ShowCartModel>? allDataModelFuture;

  Future<ShowCartModel> getAllCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    try {
      var url = '${AppConfig.BASE_URL}/cartlist';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          var jsonString = response.body;
          var allParsedData = json.decode(jsonString);
          allParsedData['data'].forEach((element) {
            progId = element;
            print('progId $progId');
          });

          cartData = ShowCartModel.fromJson(allParsedData);
        });
      }
    } catch (e) {
      print(e);
    }
    return cartData;
  }

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
        push(context: context, widget: CheckOutScreen());
      });
    } else {
      // Flutter toast
      Fluttertoast.showToast(
          msg: "Address Aldready Exist",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      var parsedData = json.decode(response.body);
      addressResponse = AddressConfirmationModel.fromJson(parsedData);
      // push(context: context, widget: CheckOutScreen());
    }
    return addressResponse;
  }

  var amountData;
  Future<TotalAmountModel> getTotalAmount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    try {
      var url = '${AppConfig.BASE_URL}/cart/items/total/price';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          var jsonString = response.body;
          setState(() {
            var amountParsedData = json.decode(jsonString);
            prefs.setString(
                'totalamount', amountParsedData['totalAmount'].toString());

            amountData = TotalAmountModel.fromJson(amountParsedData);
          });
        });
      }
    } catch (e) {
      print(e);
    }
    return amountData;
  }

  var orderResponse;
  Future<AddOrderModel> addOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    var url = '${AppConfig.BASE_URL}/addorder}';

    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    }, body: {
      "paymentMode": "test",
      "transaction_id": "test",
      "feedback": "",
      "address_id": "1",
      "message": "",
      "delievery_date": "2022-01-19",
      "totalamount": totAmount,
      "coupanCode": "",
      "total_gst": "",
      "delivery_charge": "",
      "total_after_discount": "",
      "discount_amount": "",
      "product_id": [widget.prodId] as String,
    });

    if (response.statusCode == 200) {
      setState(() {
        var parsedData = json.decode(response.body);
        orderResponse = AddOrderModel.fromJson(parsedData);
        print('Cliccccccccccccccccccccccccccccc ${widget.prodId}');
        // push(context: context, widget: CheckOutScreen());
      });
    } else {
      print('Something went wrong');
    }
    return orderResponse;
  }

  @override
  void initState() {
    super.initState();
    getTotalAmount();
    getAllCart();
    names();
  }

  names() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    totAmount = prefs.getString('totalamount');
    // prodId = prefs.getString('cartids');
  }

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
                      height: 50,
                      child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Text(
                              'Total ids: ₹ ${widget.prodId}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                            );
                          }),
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
                height: 20 * 2,
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width / 1.05,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<TotalAmountModel>(
                        future: getTotalAmount(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: const CircularProgressIndicator(),
                            );
                          } else {
                            return Padding(
                              padding: const EdgeInsets.only(left: 20, top: 20),
                              child: Text(
                                'Total Price: ₹ ${snapshot.data!.totalAmount}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            );
                          }
                        }),
                  ],
                ),
              ),
              SizedBox(
                height: 20 * 2,
              ),
              ReusablePrimaryButton(
                  childText: 'Add Order',
                  buttonColor: Colors.amber,
                  textColor: Colors.black,
                  onPressed: () async {
                    await addressConfirmation();

                    await addOrder();
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
