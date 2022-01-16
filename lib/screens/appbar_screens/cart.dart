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

  var clcik;
  var quan;
  names() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sharedString = prefs.getString('cartId'.toString());
    setState(() {
      quan = prefs.getInt('addCount');
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

  Future updateCart(String cartId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    try {
      var url = '${AppConfig.BASE_URL}/updatecart';

      final response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      }, body: {
        "cart_id": cartId.toString(),
        "count": "1",
      });

      if (response.statusCode == 200) {
        setState(() {
          var jsonString = response.body;
          var updateParsedData = json.decode(jsonString);

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
                                  print(clcik);
                                  print('Item Counts: $itemCounts');
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
                                    child: CartItems(
                                        img: img,
                                        name: datas.productName,
                                        qty: datas.count,
                                        desc: datas.description,
                                        cartId: datas.cartId,
                                        price: datas.amount)),
                              );
                            }),
                      );
                    }
                  } else {
                    return Center(child: const CircularProgressIndicator());
                  }
                }),
            // Consumer<CartProvider>(
            //   builder: (context, cartController, child) {
            //     return Padding(
            //       padding: const EdgeInsets.only(
            //         left: 20,
            //       ),
            //       child: Container(
            //         alignment: Alignment.bottomLeft,
            //         child: Text(
            //           'Total Items: ${2}',
            //           style: TextStyle(color: Colors.white, fontSize: 20),
            //         ),
            //       ),
            //     );
            //   },
            // ),

            // FutureBuilder<ShowCartModel>(
            //     future: allDataModelFuture,
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else {
            //         return Flexible(
            //           child: ListView.builder(
            //               physics: NeverScrollableScrollPhysics(),
            //               itemCount: snapshot.data!.data.length,
            //               itemBuilder: (context, index) {
            //                 return Padding(
            //                   padding: const EdgeInsets.only(
            //                     left: 20,
            //                   ),
            //                   child: Container(
            //                     alignment: Alignment.bottomLeft,
            //                     child: GetBuilder<CartCotrollerIncreaments>(
            //                       init: CartCotrollerIncreaments(),
            //                       builder: (_) {
            //                         // return Text(
            //                         //   'Total Amount: ₹ ${int.parse(snapshot.data!.data[index].amount) * _.count}'
            //                         //       .toString(),
            //                         //   style: TextStyle(
            //                         //       color: Colors.white, fontSize: 20),
            //                         // );
            //                         return GetBuilder<CartCotrollerIncreaments>(
            //                           init: CartCotrollerIncreaments(),
            //                           initState: (_) {},
            //                           builder: (_) {
            //                             return Text(
            //                               'Total Amount: ₹ ${clcik * _.count}'
            //                                   .toString(),
            //                               style: TextStyle(
            //                                   color: Colors.white,
            //                                   fontSize: 20),
            //                             );
            //                           },
            //                         );
            //                       },
            //                     ),
            //                   ),
            //                 );
            //               }),
            //         );
            //       }
            //     }),
            GetBuilder<CartCotrollerIncreaments>(
              init: CartCotrollerIncreaments(),
              initState: (controller) {},
              builder: (controller) {
                return Text(
                  'Total Amount: ₹ ${clcik * quan}'.toString(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                );
              },
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
      ),
    );
  }
}
