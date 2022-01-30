import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sandeep_jwelery/components/about_this_product.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/mini_button.dart';
import 'package:sandeep_jwelery/components/similar_products_grid.dart';
import 'package:sandeep_jwelery/components/user_review.dart';
import 'package:sandeep_jwelery/controllers/cart_cotroller.dart';
import 'package:sandeep_jwelery/models/cart_model.dart';
import 'package:sandeep_jwelery/models/category_products_details_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';

// ignore: must_be_immutable
class CategoryProductsDetails extends StatefulWidget {
  CategoryProductsDetails({
    Key? key,
    required this.prodId,
    required this.color,
    required this.size,
    required this.prodName,
  }) : super(key: key);
  String prodId;
  String size;
  String color;
  String prodName;
  @override
  _CategoryProductsDetailsState createState() =>
      _CategoryProductsDetailsState();
}

int tag = 1;
List<String> options = [
  '21',
  '25',
];
bool isClicked = false;
bool tapped = false;
int groupValue = 0;
var shopForModel;

class _CategoryProductsDetailsState extends State<CategoryProductsDetails> {
  @override
  void initState() {
    super.initState();
    detailsModelFuture = getProdCall();
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

  Future<CategoryProductsDetailsModel>? detailsModelFuture;
  var detailsResponse;
  Future<CartModel> addToCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

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
        var parsedData = json.decode(response.body);
        detailsResponse = CartModel.fromJson(parsedData);
      });
    } else {
      print('Stock Out');
    }
    return detailsResponse;
  }

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
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 3.60,
              //   width: MediaQuery.of(context).size.width,
              //   child: Carousel(
              //     images: List.generate(imgList.length, (int index) {
              //       return Column(
              //         children: [
              //           Image(
              //             image: AssetImage(imgList[index]),
              //             height: 200,
              //             width: 200,
              //           ),
              //         ],
              //       );
              //     }),
              //     autoplay: true,
              //     dotSize: 6,
              //     dotPosition: DotPosition.bottomCenter,
              //     dotColor: Colors.green,
              //     dotIncreaseSize: 2,
              //     dotIncreasedColor: Colors.amber,
              //     indicatorBgPadding: 1,
              //     dotBgColor: Colors.black12.withOpacity(0),
              //     boxFit: BoxFit.contain,
              //   ),
              // ),
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
              // InkWell(
              //   onTap: () {},
              //   child: GFAccordion(
              //     contentBackgroundColor: Colors.transparent,
              //     collapsedTitleBackgroundColor: Colors.transparent,
              //     title: 'Price Breakage',
              //     textStyle: const TextStyle(
              //       fontSize: 14,
              //       color: Colors.amber,
              //       decoration: TextDecoration.underline,
              //     ),
              //     expandedTitleBackgroundColor: Colors.transparent,
              //     contentChild: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 40),
              //       child: Column(
              //         children: [
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: const [
              //               Text(
              //                 'Gold',
              //                 style: TextStyle(
              //                     color: Colors.white54, fontSize: 14),
              //               ),
              //               Text(
              //                 '25%',
              //                 style: TextStyle(
              //                     color: Colors.white54, fontSize: 14),
              //               ),
              //               Text(
              //                 '₹${9550}',
              //                 style: TextStyle(
              //                     color: Colors.white54, fontSize: 14),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(
              //             height: 20,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: const [
              //               Text(
              //                 'Gold',
              //                 style: TextStyle(
              //                     color: Colors.white54, fontSize: 14),
              //               ),
              //               Text(
              //                 '25%',
              //                 style: TextStyle(
              //                     color: Colors.white54, fontSize: 14),
              //               ),
              //               Text(
              //                 '₹${9550}',
              //                 style: TextStyle(
              //                     color: Colors.white54, fontSize: 14),
              //               ),
              //             ],
              //           ),
              //           const SizedBox(
              //             height: 20,
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //             children: const [
              //               Text(
              //                 'Gold',
              //                 style: TextStyle(
              //                     color: Colors.white54, fontSize: 14),
              //               ),
              //               Text(
              //                 '25%',
              //                 style: TextStyle(
              //                     color: Colors.white54, fontSize: 14),
              //               ),
              //               Text(
              //                 '₹${9550}',
              //                 style: TextStyle(
              //                     color: Colors.white54, fontSize: 14),
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 20,
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
               SizedBox(
                height: 20 * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 2.30,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            addToCart();
                          });
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
                      btnColor: Colors.amber),
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
              const UserReview(
                name: 'Tushar',
                desc: '',
                count: '',
              ),
              const SizedBox(
                height: 15,
              ),
              const UserReview(
                name: 'Tushar',
                desc: '',
                count: '',
              ),
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
                  'Similar Products',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                                return SizedBox(
                                  height: 230,
                                  width: 750,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                          snapshot.data!.similarProducts.length,
                                      itemBuilder: (context, index) {
                                        var datas = snapshot
                                            .data!.similarProducts[index];
                                        var url =
                                            'https://admin.sandeepjewellers.com/app/public/img/product/';
                                        var img = url + datas.featureImg;
                                        return Card(
                                          color: Colors.white10,
                                          child: SimilarProductGrid(
                                            label: snapshot
                                                .data!
                                                .similarProducts[index]
                                                .productname,
                                            desc: snapshot
                                                .data!
                                                .similarProducts[index]
                                                .defaultSize
                                                .toString(),
                                            img: img,
                                            amount: snapshot.data!
                                                .similarProducts[index].amount,
                                          ),
                                        );
                                      }),
                                );
                              }
                          }
                        }),
                  ],
                ),
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
