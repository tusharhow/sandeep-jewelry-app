import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sandeep_jwelery/components/cart_items.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/controllers/add_cart_controller.dart';
import 'package:sandeep_jwelery/controllers/cart_cotroller.dart';
import 'package:sandeep_jwelery/controllers/show_cart_controller.dart';
import 'package:sandeep_jwelery/models/cart_model.dart';
import 'package:sandeep_jwelery/models/delete_cart_model.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:sandeep_jwelery/providers/cart_provider.dart';
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
var titalAmout;
String? sharedString;
var itemCounts;
final cartController = Get.put(CartCotrollerIncreaments());
var updateData;
var price;

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      names();

      allDataModelFuture = getAllCart();
    });
  }

  var clcik;
  var datasIndex;
  var quan;
  var pppp;
  names() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sharedString = prefs.getString('cartId'.toString());
    setState(() {
      quan = prefs.getInt('addCount');
      prefs.setInt('ffffffffff', int.parse(datasIndex));
      clcik = prefs.getInt('ffffffffff');
      itemCounts = prefs.getInt('addCount');
      pppp = prefs.getString('pfor');
    });
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
          // print(
          //     'Cart List Jsonnnnnnnnnnnn ${allParsedData['data'][0]['amount']}');
        });
      }
    } catch (e) {
      print(e);
    }
    return cartData;
  }

  // Future updateCart(String cartId) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();

  //   var token = prefs.getString('userToken');

  //   try {
  //     var url = '${AppConfig.BASE_URL}/updatecart';

  //     final response = await http.post(Uri.parse(url), headers: {
  //       "Accept": "application/json",
  //       "Authorization": "Bearer $token",
  //     }, body: {
  //       "cart_id": cartId.toString(),
  //       "count": "1",
  //     });

  //     if (response.statusCode == 200) {
  //       setState(() {
  //         var jsonString = response.body;
  //         var updateParsedData = json.decode(jsonString);

  //         updateData = ShowCartModel.fromJson(updateParsedData);
  //       });
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return updateData;
  // }

  // int? janina;
  bool isCliced = false;
  // name() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // janina = prefs.getInt('prrrr');
  // }

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

  int count = 1;
  increments() {
    setState(() {
      count++;
    });
  }

  deCrements() {
    setState(() {
      count--;
    });
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
      body: RefreshIndicator(
        onRefresh: getAllCart,
        child: Column(
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
                              price = int.parse(datas.amount) *
                                  int.parse(datas.count);

                              return InkWell(
                                onTap: () async {
                                  SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  setState(() {
                                    prefs.setInt(
                                        'ffffffffff', int.parse(datas.amount));
                                    clcik = prefs.getInt('ffffffffff');
                                    itemCounts = prefs.getInt('addCount');
                                  });
                                  print('Clicked ${clcik}');
                                  print('Item Counts: $itemCounts');
                                  print('All price: ${price}');
                                  print(
                                      'Item Counts2: ${snapshot.data!.data[index].count}');
                                },
                                child: Dismissible(
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
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  datas.productName,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                                Text(
                                                  datas.description,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                GetBuilder<
                                                    CartCotrollerIncreaments>(
                                                  init:
                                                      CartCotrollerIncreaments(),
                                                  initState: (_) {},
                                                  builder: (_) {
                                                    return Text(
                                                      '₹ ${datas.amount}',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    );
                                                  },
                                                ),
                                                Row(
                                                  children: [
                                                    GetBuilder<
                                                            CartCotrollerIncreaments>(
                                                        init:
                                                            CartCotrollerIncreaments(),
                                                        builder: (_) {
                                                          return Text(
                                                            'Quantity: ${snapshot.data!.data[index].count}',
                                                            style:
                                                                const TextStyle(
                                                                    fontSize:
                                                                        13,
                                                                    color: Colors
                                                                        .white),
                                                          );
                                                        }),
                                                    const SizedBox(
                                                      width: 40,
                                                    ),
                                                    Container(
                                                      height: 35,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              4.0,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white10,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                      child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
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
                                                                    onPressed:
                                                                        () async {
                                                                      deCrements();

                                                                      // print(
                                                                      //     'Total Amount: ${int.parse(snapshot.data!.data[index].amount) * _.count}');
                                                                    },
                                                                    icon:
                                                                        const Icon(
                                                                      Icons
                                                                          .remove,
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
                                                                return IconButton(
                                                                    onPressed:
                                                                        () async {
                                                                      increments();
                                                                      SharedPreferences
                                                                          prefs =
                                                                          await SharedPreferences
                                                                              .getInstance();
                                                                      setState(
                                                                          () {
                                                                        var itemCounts =
                                                                            prefs.getInt('addCount');
                                                                        var clcik =
                                                                            prefs.getInt('ffffffffff');
                                                                        print(
                                                                            'Count ${itemCounts}');
                                                                        print(
                                                                            'Price ${clcik}');
                                                                      });
                                                                    },
                                                                    icon:
                                                                        const Icon(
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
                                        ],
                                      ),
                                    )),
                              );
                            }),
                      );
                    }
                  } else {
                    return Center(child: const CircularProgressIndicator());
                  }
                }),
            FutureBuilder<ShowCartModel>(
                future: allDataModelFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: const CircularProgressIndicator());
                  } else {
                    return Text(
                      'Total Amount: ₹ ${price }',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    );
                  }
                }),
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
      ),
    );
  }
}
