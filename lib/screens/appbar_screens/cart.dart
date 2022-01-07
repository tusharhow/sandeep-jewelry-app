import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/controllers/add_cart_controller.dart';
import 'package:sandeep_jwelery/controllers/cart_cotroller.dart';
import 'package:sandeep_jwelery/controllers/show_cart_controller.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

// final showCartController = Get.put(ShowCartController());
var allParsedData;
var cartData;

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    allDataModelFuture = getAllCart();
  }

  Future<ShowCartModel>? allDataModelFuture;
  final cartController = Get.put(CartCotrollerIncreaments());
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
      // print(" url call from " + url);
      if (response.statusCode == 200) {
        // print('url hit successful' + response.body);
        setState(() {
          var jsonString = response.body;
          allParsedData = json.decode(jsonString);

          cartData = ShowCartModel.fromJson(allParsedData);
        });
      }
    } catch (e) {
      print(e);
    }
    return cartData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<ShowCartModel>(
              future: allDataModelFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (context, index) {
                          var datas = snapshot.data!.data[index];
                          var url =
                              'https://admin.sandeepjewellers.com/app/public/img/product/';
                          var img = url + datas.image;

                          return Card(
                            color: Colors.white10,
                            child: Row(
                              children: [
                                Image(
                                  image: NetworkImage(img),
                                  height: 100,
                                  width: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.data[index].jwelleryType
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                      Text(
                                        snapshot.data!.data[index].description
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Quantity: ' +
                                            cartController.count.toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                // Padding(
                                //   padding: const EdgeInsets.only(right: 20),
                                //   child: Text(
                                //     '₹ ${snapshot.data!.data[index].amount}'
                                //         .toString(),
                                //     style: TextStyle(
                                //         color: Colors.white, fontSize: 20),
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                  ),
                                  child: Container(
                                      alignment: Alignment.bottomLeft,
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.remove_circle_outlined,
                                            color: Colors.red,
                                          ))),
                                ),
                              ],
                            ),
                          );
                        }),
                  );
                }
              }),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Total Items: ${cartController.counter}'.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: 20,
          //   ),
          //   child: Container(
          //     alignment: Alignment.bottomLeft,
          //     child: Text(
          //       'Total Amount: ${cartController.totalPrice}'.toString(),
          //       style: TextStyle(color: Colors.white, fontSize: 20),
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Total Amount: ${cartController.totalPrice}'.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ReusablePrimaryButton(
              childText: 'Checkout',
              buttonColor: Colors.orange,
              textColor: Colors.black,
              onPressed: () {}),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
