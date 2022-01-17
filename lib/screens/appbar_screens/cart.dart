import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/controllers/cart_cotroller.dart';
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
var cartId;
var titalAmout;
String? sharedString;
var itemCounts;
final cartController = Get.put(CartCotrollerIncreaments());
var updateData;
var totalPrice;

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      names();
      updateCart();
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
        });
      }
    } catch (e) {
      print(e);
    }
    return cartData;
  }

  int updateDataCount = 1;
  int get updateDataCounts => updateDataCount;
  incrementsCart() {
    setState(() {
      updateDataCount++;
    });
  }

  decreamentsCart() {
    setState(() {
      if (updateDataCount > 1) {
        updateDataCount--;
      }
    });
  }

  Future updateCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    try {
      var url = '${AppConfig.BASE_URL}/updatecart';

      final response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      }, body: {
        "cart_id": cartId.toString(),
        "count": updateDataCounts.toString(),
      });

      if (response.statusCode == 200) {
        setState(() {
          var jsonString = response.body;
          var updateParsedData = json.decode(jsonString);
          print('Cartttttttttttt ${cartId}');
          updateData = ShowCartModel.fromJson(updateParsedData);
        });
      }
    } catch (e) {
      print(e);
    }
    return updateData;
  }

  // int? janina;
  bool isCliced = false;

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

  // int count = 1;
  // increments() {
  //   setState(() {
  //     count++;
  //   });
  // }

  // deCrements() {
  //   setState(() {
  //     count--;
  //   });
  // }

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
                              totalPrice = int.parse(datas.amount) *
                                  int.parse(datas.count) *
                                  2;

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
                                  print('All price: ${totalPrice}');
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
                                                              3.10,
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
                                                                      setState(
                                                                          () {
                                                                        decreamentsCart();
                                                                        updateCart();
                                                                        print(
                                                                            'Minus');
                                                                      });
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
                                                          Text(
                                                            updateDataCounts
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 10),
                                                          ),
                                                          GetBuilder<
                                                                  CartCotrollerIncreaments>(
                                                              init:
                                                                  CartCotrollerIncreaments(),
                                                              builder: (_) {
                                                                return IconButton(
                                                                    onPressed:
                                                                        () async {
                                                                      incrementsCart();
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
                                                                        cartId =
                                                                            datas.cartId;
                                                                        print(
                                                                            'Plus');
                                                                        print(
                                                                            'Cart Id: $cartId');
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
                    return Column(
                      children: [
                        Text(
                          'Total Items: ₹ ${snapshot.data!.data.fold(0, (a, b) => int.parse(a.toString()) + int.parse(b.count))}',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Text(
                          'Total amounts: ₹ ${snapshot.data!.data.fold(0, (a, b) => int.parse(a.toString()) + int.parse(b.amount)) * int.parse(snapshot.data!.data[0].count.toString())}',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
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
