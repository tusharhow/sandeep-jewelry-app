import 'package:flutter/material.dart';
import 'package:flutter_cart/flutter_cart.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/controllers/cart_cotroller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartItems extends StatefulWidget {
  CartItems(
      {Key? key,
      required this.img,
      required this.name,
      required this.qty,
      required this.cartId,
      required this.desc,
      required this.price})
      : super(key: key);
  final img;
  final name;
  final price;
  final desc;
  final qty;
  final cartId;
  @override
  _CartItemsState createState() => _CartItemsState();
}

var cart = FlutterCart();

class _CartItemsState extends State<CartItems> {
  @override
  void initState() {
    super.initState();
    names();
  }

  names() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      quan = prefs.getInt('addCount');
    });
  }

  var quan;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      child: Row(
        children: [
          Image(
            image: NetworkImage(widget.img),
            height: 120,
            width: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Text(
                  widget.desc,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 10,
                ),
                GetBuilder<CartCotrollerIncreaments>(
                  init: CartCotrollerIncreaments(),
                  initState: (_) {},
                  builder: (_) {
                    return Text(
                      '₹ ${widget.price}',
                      style: TextStyle(color: Colors.white),
                    );
                  },
                ),
                Row(
                  children: [
                    GetBuilder<CartCotrollerIncreaments>(
                        init: CartCotrollerIncreaments(),
                        builder: (_) {
                          return Text(
                            'Quantity: ${quan}',
                            style: const TextStyle(
                                fontSize: 13, color: Colors.white),
                          );
                        }),
                    // Text(
                    //     ' Select Quantity: ${snapshot.data!.data[index].amount}',
                    //     style: TextStyle(
                    //         fontSize: 13,
                    //         color: Colors.white)),
                    const SizedBox(
                      width: 40,
                    ),
                    Container(
                      height: 35,
                      width: MediaQuery.of(context).size.width / 4.0,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GetBuilder<CartCotrollerIncreaments>(
                              init: CartCotrollerIncreaments(),
                              builder: (_) {
                                return IconButton(
                                    onPressed: () async {
                                      _.decrements();

                                      // print(
                                      //     'Total Amount: ${int.parse(snapshot.data!.data[index].amount) * _.count}');
                                    },
                                    icon: const Icon(
                                      Icons.remove,
                                      size: 14,
                                      color: Colors.amber,
                                    ));
                              }),
                          // GetBuilder<
                          //         CartCotrollerIncreaments>(
                          //     init:
                          //         CartCotrollerIncreaments(),
                          //     builder: (_) {
                          //       return Text(
                          //         '${_.count}',
                          //         style: const TextStyle(
                          //             fontSize: 13,
                          //             color: Colors
                          //                 .white),
                          //       );
                          //     }),
                          GetBuilder<CartCotrollerIncreaments>(
                              init: CartCotrollerIncreaments(),
                              builder: (_) {
                                return IconButton(
                                    onPressed: () async {
                                      _.increments();
                                      SharedPreferences prefs =
                                          await SharedPreferences.getInstance();
                                      setState(() {
                                        var itemCounts =
                                            prefs.getInt('addCount');
                                        var clcik = prefs.getInt('ffffffffff');
                                        print('Count ${itemCounts}');
                                        print('Price ${clcik}');
                                      });

                                      // int quantity =
                                      //     _.count;
                                      // int price = int.parse(snapshot
                                      //     .data!
                                      //     .data[
                                      //         index]
                                      //     .amount);
                                      // quantity++;
                                      // int newPrice =
                                      //     price *
                                      //         quantity;
                                      // SharedPreferences
                                      //     prefs =
                                      //     await SharedPreferences
                                      //         .getInstance();
                                      // prefs.setInt(
                                      //     'prrrr',
                                      //     newPrice);
                                      // print(
                                      //     'Total Amount: ${int.parse(snapshot.data!.data[index].amount) * _.count}');
                                      // print(
                                      //     'Total Amount: ${int.parse(snapshot.data!.data[index].amount) * _.count}');
                                    },
                                    icon: const Icon(
                                      Icons.add,
                                      size: 14,
                                      color: Colors.amber,
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
    );
  }
}
