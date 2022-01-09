import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/controllers/add_cart_controller.dart';
import 'package:sandeep_jwelery/controllers/cart_cotroller.dart';
import 'package:sandeep_jwelery/controllers/show_cart_controller.dart';
import 'package:sandeep_jwelery/models/delete_cart_model.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../config.dart';
import '../address_confirmation.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

var allParsedData;
var allDeleteParsedData;
var deleteData;
var cartData;
String? sharedString;
final cartController = Get.put(CartCotrollerIncreaments());

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      names();
      allDataModelFuture = getAllCart();
      // deleteCartItems(sharedString.toString());
    });
  }

  names() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sharedString = prefs.getString('cartId'.toString());
  }

  Future<ShowCartModel>? allDataModelFuture;
  Future<DeleteCartModel>? allDeleteDataModelFuture;

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
          allParsedData = json.decode(jsonString);

          cartData = ShowCartModel.fromJson(allParsedData);
        });
      }
    } catch (e) {
      print(e);
    }
    return cartData;
  }

  Future<DeleteCartModel> deleteCartItems(String cartId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    try {
      var url = '${AppConfig.BASE_URL}/deletecart';

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {
          "cart_id": cartId.toString(),
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          var jsonDeleteString = response.body;
          allDeleteParsedData = json.decode(jsonDeleteString);

          deleteData = DeleteCartModel.fromJson(allDeleteParsedData);
        });
      }
    } catch (e) {
      print(e);
    }
    return deleteData;
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
                if (snapshot.connectionState == ConnectionState.done) {
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

                            return Dismissible(
                              key: UniqueKey(),
                              onDismissed: (direction) {
                                setState(() {
                                  deleteCartItems(snapshot
                                      .data!.data[index].cartId
                                      .toString());
                                });
                                allDataModelFuture = getAllCart();
                              },
                              child: Card(
                                color: Colors.white10,
                                child: Row(
                                  children: [
                                    Image(
                                      image: NetworkImage(img),
                                      height: 120,
                                      width: 100,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data?.data[index]
                                                    .jwelleryType ??
                                                'Deleted',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                          Text(
                                            snapshot.data?.data[index]
                                                    .description ??
                                                'Deletedddd',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              const Text('Select Quantity',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Colors.white)),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Container(
                                                height: 35,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    3.65,
                                                decoration: BoxDecoration(
                                                  color: Colors.white10,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GetBuilder<
                                                            CartCotrollerIncreaments>(
                                                        init:
                                                            CartCotrollerIncreaments(),
                                                        builder: (_) {
                                                          return IconButton(
                                                              onPressed: () {
                                                                _.decrements();
                                                              },
                                                              icon: const Icon(
                                                                Icons.remove,
                                                                size: 14,
                                                                color: Colors
                                                                    .amber,
                                                              ));
                                                        }),
                                                    GetBuilder<
                                                            CartCotrollerIncreaments>(
                                                        init:
                                                            CartCotrollerIncreaments(),
                                                        builder: (_) {
                                                          return Text(
                                                            '${_.counter}',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .white),
                                                          );
                                                        }),
                                                    GetBuilder<
                                                            CartCotrollerIncreaments>(
                                                        init:
                                                            CartCotrollerIncreaments(),
                                                        builder: (_) {
                                                          return IconButton(
                                                              onPressed: () {
                                                                _.increments();
                                                              },
                                                              icon: const Icon(
                                                                Icons.add,
                                                                size: 14,
                                                                color: Colors
                                                                    .amber,
                                                              ));
                                                        }),
                                                  ],
                                                ),
                                              ),
                                            ],
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
                                    // Padding(
                                    //   padding: const EdgeInsets.only(
                                    //     left: 20,
                                    //   ),
                                    //   child: Container(
                                    //       alignment: Alignment.bottomLeft,
                                    //       child: IconButton(
                                    //           onPressed: () async {
                                    //             SharedPreferences prefs =
                                    //                 await SharedPreferences
                                    //                     .getInstance();
                                    //             prefs.setString(
                                    //                 'cartId',
                                    //                 snapshot
                                    //                     .data!.data[index].cartId
                                    //                     .toString());
                                    // setState(() {
                                    //   deleteCartItems(snapshot
                                    //       .data!.data[index].cartId
                                    //       .toString());
                                    // });
                                    //           },
                                    //           icon: Icon(
                                    //             Icons.remove_circle_outlined,
                                    //             color: Colors.red,
                                    //           ))),
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }
                } else {
                  return Center(child: const CircularProgressIndicator());
                }
              }),
          // Padding(
          //   padding: const EdgeInsets.only(
          //     left: 20,
          //   ),
          //   child: Container(
          //     alignment: Alignment.bottomLeft,
          //     child: Text(
          //       'Total Items: ${cartController.count}'.toString(),
          //       style: TextStyle(color: Colors.white, fontSize: 20),
          //     ),
          //   ),
          // ),
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
                'Total Amount: ${cartController.count}'.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ReusablePrimaryButton(
              childText: 'Place Order',
              buttonColor: Colors.orange,
              textColor: Colors.black,
              onPressed: () {
                push(context: context, widget: AddressConfirmation());
              }),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
