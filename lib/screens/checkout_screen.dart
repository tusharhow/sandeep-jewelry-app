import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/models/add_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutScreen extends StatefulWidget {
  CheckOutScreen({Key? key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  var orderResponse;
  Future<AddOrderModel> addOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    var url = 'https://admin.sandeepjewellers.com/app/public/api/addorder';

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
      "totalamount": "123323",
      "coupanCode": "",
      "total_gst": "",
      "delivery_charge": "",
      "total_after_discount": "",
      "discount_amount": "",
      "product_id": ["1"]
    });

    if (response.statusCode == 200) {
      setState(() {
        var parsedData = json.decode(response.body);
        orderResponse = AddOrderModel.fromJson(parsedData);
      });
    } else {
      print('failed to get data');
    }
    return orderResponse;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Check Out'),
        ),
        body: Column(
          children: [
            Container(
              child: FutureBuilder<AddOrderModel>(
                future: addOrder(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data!.orderId.toString(),
                      style: TextStyle(color: Colors.white),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            )
          ],
        ));
  }
}
