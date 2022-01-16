import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:carousel_pro/carousel_pro.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:sandeep_jwelery/components/about_this_product.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/mini_button.dart';
import 'package:sandeep_jwelery/components/similar_products_grid.dart';
import 'package:sandeep_jwelery/components/user_review.dart';
import 'package:sandeep_jwelery/controllers/add_cart_controller.dart';
import 'package:sandeep_jwelery/controllers/cart_cotroller.dart';
import 'package:sandeep_jwelery/controllers/product_details_controller.dart';
import 'package:sandeep_jwelery/models/cart_model.dart';
import 'package:sandeep_jwelery/models/category_products_details_model.dart';
import 'package:sandeep_jwelery/models/product_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';

// final cartCotroller = Get.put(CartController());
// final productDetailsCotroller = Get.put(ProductDetailsController());

// ignore: must_be_immutable
class ProductDetailView extends StatefulWidget {
  String prodId;
  String size;
  String items;
  String prodName;
  String color;
  String img;
  String prodPrice;

  ProductDetailView({
    required this.prodId,
    required this.size,
    required this.items,
    required this.prodName,
    required this.img,
    required this.prodPrice,
    required this.color,
  });

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final List<String> imgList = [
    "assets/images/jew2.png",
    "assets/images/jew3.png",
  ];

  // final productDetailsController = Get.put(ProductDetailsController());
  // final cartController = Get.put(CartController());

  int tag = 1;
  List<String> options = [
    '21',
    '25',
  ];
  bool isClicked = false;
  bool tapped = false;
  int groupValue = 0;
  var shopForModel;
  var detailsForModel;
  var productCount;
  var productPrice;
  var prodName;
  var prodCount;
  var prodSizee;
  var prodeColor;
  var prodPrice;
  var prodId;
  var parsedData;
  var detailsResponse;
  void initState() {
    super.initState();
    setState(() {
      names();
      shareds();

      // addToCart();
      detailsModelFuture = getProdCall();
    });
  }

  Future<CategoryProductsDetailsModel>? detailsModelFuture;

  Future<CartModel>? dataModelFuture;

  Future<CategoryProductsDetailsModel> getProdCall() async {
    try {
      var url = '${AppConfig.BASE_URL}/product_detail';

      final response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
      }, body: {
        "product_id": widget.prodId.toString(),
      });

      if (response.statusCode == 200) {
        var parsedData = json.decode(response.body);

        shopForModel = CategoryProductsDetailsModel.fromJson(parsedData);
      }
    } catch (e) {
      print(e);
    }
    return shopForModel;
  }

  int dataCount = 1;
  int get dataCounts => dataCount;
  incrementsCart() {
    setState(() {
      dataCount++;
    });
  }

  decreamentsCart() {
    setState(() {
      if (dataCount > 1) {
        dataCount--;
      }
    });
  }

  var pppp;
  Future<CartModel> addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');
    var itemsCounts = prefs.getInt('itemCounts');

    var url = 'https://admin.sandeepjewellers.com/app/public/api/cart';

    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    }, body: {
      "product_id": widget.prodId.toString(),
      "product_size": widget.size.toString(),
      "count": dataCount.toString(),
      "selectedColor": widget.color,
      "jwellery_name": widget.prodName,
      "assests": ""
    });

    if (response.statusCode == 200) {
      setState(() {
        parsedData = json.decode(response.body);
        detailsResponse = CartModel.fromJson(parsedData);
      });
    } else {
      print('failed to get data');
    }
    return detailsResponse;
  }

  Future<ProductDetailsModel>? productDetailsModelFuture;
  names() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("prodNam", widget.prodName.toString());
    prefs.setString("prodSize", widget.size.toString());
    prefs.setString("prodCount", widget.items.toString());
    prefs.setString("prodImg", widget.img.toString());
    prefs.setString('prodPrice', widget.prodPrice.toString());
    prefs.setString("prodColor", widget.color.toString());
  }

  shareds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('userToken');
    prodId = prefs.getString('proId');
    prodName = prefs.getString('prodNam');
    prodeColor = prefs.getString('prodColor');
    prodCount = prefs.getString('prodCount');
    prodPrice = prefs.getString('prodPrice');
    prodSizee = prefs.getString('prodSize');
  }

  // Future<ProductDetailsModel> getProdCall() async {
  //   try {
  //     var url = '${AppConfig.BASE_URL}/product_detail';

  //     final response = await http.post(Uri.parse(url), headers: {
  //       "Accept": "application/json",
  //     }, body: {
  //       "product_id": widget.prodId.toString(),
  //     });

  //     if (response.statusCode == 200) {
  //       var parsedData = json.decode(response.body);

  //       detailsForModel = ProductDetailsModel.fromJson(parsedData);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   return detailsForModel;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: FutureBuilder<CategoryProductsDetailsModel>(
              future: detailsModelFuture,
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:

                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(snapshot.data!.data.jwelleryName,
                            style: TextStyle(color: Colors.white)),
                      );
                    }
                }
              }),
          backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              FutureBuilder<CategoryProductsDetailsModel>(
                  future: detailsModelFuture,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              child: Swiper(
                                  viewportFraction: 0.8,
                                  fade: 0.3,
                                  scale: 0.9,
                                  autoplay: true,
                                  itemCount: snapshot.data!.data.files.length,
                                  itemBuilder: (context, index) {
                                    var datas =
                                        snapshot.data!.data.files[index];
                                    var url =
                                        'https://admin.sandeepjewellers.com/app/public/img/product/';
                                    var url2 = url + datas.image;

                                    return Image(
                                      image: NetworkImage(url2),
                                      height: 130,
                                      width: 130,
                                    );
                                  }));
                        }
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/icons/tag.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Flat 50% Off on this Product',
                      style: TextStyle(fontSize: 14, color: Colors.amber)),
                  const Spacer(),
                  // IconButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       tapped = !tapped;
                  //     });
                  //   },
                  //   icon: Icon(
                  //     Icons.favorite,
                  //     color: tapped ? Colors.red : Colors.grey,
                  //   ),
                  //   splashColor: Colors.redAccent,
                  //   iconSize: 30,
                  // ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              FutureBuilder<CategoryProductsDetailsModel>(
                  future: detailsModelFuture,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(snapshot.data!.data.jwelleryName.toString(),
                            style:
                                TextStyle(fontSize: 23, color: Colors.white)),
                      );
                    }
                  }),

              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // Container(
                  //   alignment: Alignment.bottomLeft,
                  //   child: Text('₹ ${"widget.prodPrice"}',
                  //       style: TextStyle(fontSize: 25, color: Colors.white)),
                  // ),
                  FutureBuilder<CategoryProductsDetailsModel>(
                      future: detailsModelFuture,
                      builder: (context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(),
                            );

                          default:
                            if (!snapshot.hasData) {
                              return Container(
                                  child: Text(
                                snapshot.hasError.toString(),
                                style: TextStyle(color: Colors.white),
                              ));
                            } else {
                              return Container(
                                alignment: Alignment.bottomLeft,
                                child: Text('₹ ${snapshot.data!.data.amount}',
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white)),
                              );
                            }
                        }
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  // const Text(
                  //   '₹${5455}',
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     color: Colors.white,
                  //     decoration: TextDecoration.lineThrough,
                  //   ),
                  // ),
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     alignment: Alignment.bottomLeft,
              //     child: const Text(
              //       'Price Breakage',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.amber,
              //         decoration: TextDecoration.underline,
              //       ),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {},
                child: GFAccordion(
                  contentBackgroundColor: Colors.transparent,
                  collapsedTitleBackgroundColor: Colors.transparent,
                  title: 'Price Breakage',
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.amber,
                    decoration: TextDecoration.underline,
                  ),
                  expandedTitleBackgroundColor: Colors.transparent,
                  contentChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Gold',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '25%',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '₹${9550}',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Gold',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '25%',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '₹${9550}',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Gold',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '25%',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '₹${9550}',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text('In Stock',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text('Select Quantity',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 2.60,
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<CartCotrollerIncreaments>(
                            init: CartCotrollerIncreaments(),
                            builder: (_) {
                              return TextButton(
                                  onPressed: () {
                                    decreamentsCart();
                                  },
                                  child: const Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.amber),
                                  ));
                            }),
                        GetBuilder<CartCotrollerIncreaments>(
                            init: CartCotrollerIncreaments(),
                            builder: (_) {
                              return Text(
                                '${dataCount}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              );
                            }),
                        GetBuilder<CartCotrollerIncreaments>(
                            init: CartCotrollerIncreaments(),
                            builder: (_) {
                              return TextButton(
                                onPressed: () {
                                  incrementsCart();
                                },
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.amber),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20 * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // MiniButton(
                  //   btnText: 'Add to Cart',
                  //   onPressed: () async {
                  // SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  // setState(() {
                  //   prefs.setString('dataCount', widget.items);
                  //   addToCart();
                  // });
                  // print('Add to cart ${dataCounts}');
                  //     print('object');
                  //   },
                  //   btnTextColor: Colors.white,
                  //   // btnColor: const Color(0xff393939)
                  //   btnColor: Colors.white24,
                  // ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.30,
                    child: ElevatedButton(
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          setState(() {
                            prefs.setString('dataCount', widget.items);
                            prefs.setInt('addCount', dataCounts);

                            productCount = prefs.getInt('addCount');
                            prefs.setString('pfor', widget.prodPrice);
                            pppp = prefs.getString('pfor');
                            addToCart();
                          });
                          print('cart: ${productCount}');
                          print('Price: ${pppp}');
                        },
                        child: Text('Add to cart')),
                  ),
                  MiniButton(
                      btnText: 'Buy Now',
                      onPressed: () {
                        setState(() {
                          addToCart();
                        });
                      },
                      btnTextColor: Colors.black,
                      btnColor: Colors.orange),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Select Weight (grams)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  // ChipsChoice<int>.single(
                  //   choiceStyle: const C2ChoiceStyle(color: Colors.white),
                  //   value: tag,
                  //   choiceActiveStyle: const C2ChoiceStyle(color: Colors.amber),
                  //   onChanged: (val) => setState(() => tag = val),
                  //   choiceItems: C2Choice.listFrom<int, String>(
                  //     source: options,
                  //     value: (i, v) => i,
                  //     label: (i, v) => v,
                  //   ),
                  // ),

                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          if (isClicked == false) {
                            {
                              isClicked = true;
                            }
                          } else {
                            isClicked = false;
                          }
                        },
                      );
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 4.20,
                      decoration: BoxDecoration(
                        color:
                            isClicked == true ? Colors.amber : Colors.white10,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          widget.size,
                          style: TextStyle(
                              color: isClicked == true ? Colors.black : null),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Certified By',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 15,
                  ),
                  Image(
                    image: AssetImage('assets/logos/logo2.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Delivery Options',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.black12,
                          hintText: 'Enter Pin Code',
                          hintStyle: TextStyle(color: Colors.white54)),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3.30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text('Check'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'About the Product',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const AboutThisProduct(
                  label: 'Brand', labelDesc: 'Sandeep Jewellers'),
              const SizedBox(
                height: 15,
              ),
              const AboutThisProduct(label: 'hsn Code', labelDesc: 'skiwya'),
              const SizedBox(
                height: 15,
              ),
              const AboutThisProduct(
                  label: 'Features',
                  labelDesc:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis,am viverra orci sagittis eu volutpat odio'),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: const [
                    Text(
                      'Ratings & Reviews',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '5.0 (834)',
                      style: TextStyle(color: Colors.white54, fontSize: 9),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const UserReview(),
              const SizedBox(
                height: 15,
              ),
              const UserReview(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Similar Product',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SimilarProductGrid(),
                  SimilarProductGrid(),
                ],
              ),
              const SizedBox(
                height: 20 * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
