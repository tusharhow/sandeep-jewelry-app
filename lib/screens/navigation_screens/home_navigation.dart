import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandeep_jwelery/components/list_tile_card.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/shop_carousel.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/components/todays_deals_card.dart';
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/controllers/banner_controller.dart';
import 'package:sandeep_jwelery/controllers/product_controller.dart';
import 'package:sandeep_jwelery/controllers/shop_for-controller.dart';
import 'package:sandeep_jwelery/models/banner_model.dart';
import 'package:sandeep_jwelery/models/product_model.dart';
import 'package:sandeep_jwelery/models/shop_for_category.dart';
import 'package:sandeep_jwelery/screens/category_details.dart';
import 'package:sandeep_jwelery/screens/product_details.dart';
import 'package:sandeep_jwelery/screens/view_all_products.dart';

final productController = Get.put(ProductController());
final bannerController = Get.put(BannerController());
final shopForController = Get.put(ShopForController());

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  @override
  void initState() {
    super.initState();
    bannerModelFuture = getBannerData();
  }

  Future<BannerModel>? bannerModelFuture;

  var bannerModelData;

  var decodedData;
  var url = "${AppConfig.BASE_URL}/banner";
  Future<BannerModel> getBannerData() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;

        decodedData = json.decode(jsonString);
        bannerModelData = BannerModel.fromJson(decodedData);
        print(' $decodedData');
      }
    } catch (e) {
      print(e);
    }
    return bannerModelData;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  FutureBuilder<BannerModel>(
                      future: bannerController.bannerModelFuture,
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
                                ),
                              );
                            } else {
                              return SizedBox(
                                height: 160,
                                child: ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      var datas =
                                          bannerController.decodedData['data'];

                                      var url =
                                          'https://admin.sandeepjewellers.com/app/public/img/banner/';
                                      var img =
                                          '${url + bannerController.decodedData['data'][index]['image']}';
                                      return ClipRRect(
                                        borderRadius: BorderRadius.circular(25),
                                        child: Image(
                                          image: NetworkImage(
                                            img,
                                          ),
                                          color: Colors.black38,
                                          colorBlendMode: BlendMode.hardLight,
                                          fit: BoxFit.contain,
                                        ),
                                      );
                                    }),
                              );
                            }
                        }
                      }),
                  Positioned(
                      left: 10,
                      top: 30,
                      child: FutureBuilder<BannerModel>(
                          future: bannerController.bannerModelFuture,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Text(
                                snapshot.data!.data[0].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              );
                            }
                          })),
                  Positioned(
                      left: 110,
                      top: 90,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                            height: 45,
                            width: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text('Browse Now'),
                            )),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Shop for',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<ShopForCategoryModel>(
                  future: shopForController.allDataModelFuture,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        if (snapshot.hasData) {
                          return Container(
                            child: Text(
                              snapshot.error.toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 140,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                var url =
                                    'https://admin.sandeepjewellers.com/app/public/img/category/';
                                var img =
                                    '${url + shopForController.allParsedData['data'][index]['image']}';
                                var podId = shopForController
                                    .allParsedData['data'][index]['id'];
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      print('Product Id: $podId');
                                      push(
                                          context: context,
                                          widget: CategoryDetails(
                                              varId: podId.toString()));
                                    });

                                    // print(shopForController.allParsedData['data'][index]['id']);
                                  },
                                  child: Card(
                                    elevation: 0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    color: Colors.white10,
                                    child: ShopCarousel(
                                      image: img,
                                      label: shopForController
                                              .allParsedData['data'][index]
                                          ['category'],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                    }
                  }),

              const SizedBox(
                height: 15,
              ),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Today’s Deals',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<ProductModel>(
                  future: productController.dataModelFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 200,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              var datas = snapshot.data!.data[index];

                              var url =
                                  'https://admin.sandeepjewellers.com/app/public/img/product/';
                              var img = '${url + datas.image}';
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    print('Product Id: ${datas.id}');
                                    push(
                                      context: context,
                                      widget: ProductDetailView(
                                        prodId: datas.id.toString(),
                                        img: img,
                                        color: datas.color,
                                        prodName: datas.jwelleryName,
                                        size: datas.defaultSize,
                                        items: datas.defaultSize,
                                        prodPrice: datas.amount,
                                      ),
                                    );
                                  });
                                },
                                child: Card(
                                  elevation: 0,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 6),
                                  color: Colors.black,
                                  child: Row(
                                    children: [
                                      TodaysDealsCard(
                                        label: datas.jwelleryName,
                                        labelImage: img,
                                        productDesc: datas.description,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      );
                    } else {
                      return Center(
                          child: Center(child: CircularProgressIndicator()));
                    }
                  }),
              // FutureBuilder<ProductModel>(
              //     future: productController.dataModelFuture,
              //     builder: (context, snapshot) {
              //       return SizedBox(
              //         height: 100,
              //         child: ListView.builder(
              //             shrinkWrap: true,
              //             itemCount: snapshot.data!.data.length,
              //             itemBuilder: (context, index) {
              //               var datas = snapshot.data!.data[index];
              //               print('Data: ${datas.jwelleryName}');
              //               return Text(
              //                 datas.jwelleryName.toString(),
              //                 style: TextStyle(color: Colors.white),
              //               );
              //             }),
              //       );
              //     }),

              const SizedBox(
                height: 20,
              ),
              // FutureBuilder(
              //     future: productController.dataModelFuture,
              //     builder: (context, snapshot) {
              //       return Text(
              //         bannerController.decodedData['data'][0]['productname']
              //             .toString(),
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 20,
              //         ),
              //       );
              //     }),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'House of Collection',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  FutureBuilder<ProductModel>(
                      future: productController.dataModelFuture,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              primary: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                var datas = snapshot.data!.data[index];

                                var url =
                                    'https://admin.sandeepjewellers.com/app/public/img/product/';
                                var img = '${url + datas.image}';
                                return InkWell(
                                    onTap: () {
                                      setState(() {
                                        print('Product Id: ${datas.id}');
                                        push(
                                          context: context,
                                          widget: ProductDetailView(
                                            prodId: datas.id.toString(),
                                            img: img,
                                            color: datas.color,
                                            prodName: datas.jwelleryName,
                                            size: datas.defaultSize,
                                            items: datas.defaultSize,
                                            prodPrice: datas.amount,
                                          ),
                                        );
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Container(
                                          decoration: const BoxDecoration(
                                              color: Colors.white12,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.network(img,
                                                    height: 100,
                                                    width: 100,
                                                    fit: BoxFit.contain),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(datas.jwelleryName,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Colors.white)),
                                                Container(
                                                  child: Text(
                                                      datas.amount.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                      )),
                                                ),
                                              ])),
                                    ));
                              });
                        } else {
                          return CircularProgressIndicator();
                        }
                      }),
                ],
              ),
              const SizedBox(height: 15),
              Center(
                child: TextButton(
                  onPressed: () {
                    push(context: context, widget: ViewAllProducts());
                  },
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder<BannerModel>(
                  future: bannerController.bannerModelFuture,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      default:
                        if (snapshot.hasData) {
                          return Container(
                            child: Text(snapshot.hasError.toString()),
                          );
                        } else {
                          return SizedBox(
                            height: 160,
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  var datas =
                                      bannerController.decodedData['data'];
                                  // var fuck = snapshot.data!.data[index];
                                  var url =
                                      'https://admin.sandeepjewellers.com/app/public/img/banner/';
                                  var img =
                                      '${url + bannerController.decodedData['data'][index]['image']}';
                                  return Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                        image: NetworkImage(
                                          img,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                }),
                          );
                        }
                    }
                  }),
              FutureBuilder<BannerModel>(
                  future: bannerController.bannerModelFuture,
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
                            ),
                          );
                        } else {
                          return SizedBox(
                            height: 130,
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  var datas =
                                      bannerController.decodedData['data'];

                                  var url =
                                      'https://admin.sandeepjewellers.com/app/public/img/banner/';
                                  var img =
                                      '${url + bannerController.decodedData['data'][3]['image']}';
                                  return ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image(
                                      image: NetworkImage(
                                        img,
                                      ),
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                }),
                          );
                        }
                    }
                  }),
              Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    'Shop from our Instagram',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<ProductModel>(
                  future: productController.dataModelFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          primary: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            var datas = snapshot.data!.data[index];
                            var url =
                                'https://admin.sandeepjewellers.com/app/public/img/product/';
                            var img = '${url + datas.image}';
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    print('Product Id: ${datas.id}');
                                    push(
                                      context: context,
                                      widget: ProductDetailView(
                                        prodPrice: datas.amount,
                                        prodId: datas.id.toString(),
                                        img: img,
                                        color: datas.color,
                                        prodName: datas.jwelleryName,
                                        size: datas.defaultSize,
                                        items: datas.defaultSize,
                                      ),
                                    );
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(img,
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.contain),
                                            Text(datas.productname,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.white)),
                                            Text(datas.amount.toString(),
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                  fontSize: 12,
                                                )),
                                          ])),
                                ));
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Our Exclusive Collections',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: const [
              //       Image(
              //         image: AssetImage('assets/images/necklace.png'),
              //       ),
              //       Image(
              //         image: AssetImage('assets/images/necklace2.png'),
              //       ),
              //       Image(
              //         image: AssetImage('assets/images/ring.png'),
              //       ),
              //       Image(
              //         image: AssetImage('assets/images/ring2.png'),
              //       ),
              //     ],
              //   ),
              // ),
              // FutureBuilder<ProductModel>(
              //     future: productList,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return ListView.builder(
              //             shrinkWrap: true,
              //             primary: true,
              //             scrollDirection: Axis.horizontal,
              //             itemCount: 4,
              //             itemBuilder: (context, index) {
              //               var datas = snapshot.data!.products[index];
              //               return InkWell(
              //                   onTap: () => print("click"),
              //                   child: Padding(
              //                     padding: const EdgeInsets.all(5),
              //                     child: Container(
              //                         child: Image.network(datas.image)),
              //                   ));
              //             });
              //       } else {
              //         return CircularProgressIndicator();
              //       }
              //     }),
              const SizedBox(
                height: 20,
              ),
              const ListTileCard(
                image: 'assets/images/ring2.png',
                label: 'Get Exclusive Discounts',
                btnText: 'Give me Gifts',
                subTitle: 'Get Ones',
              ),
              const SizedBox(
                height: 20,
              ),
              const ListTileCard(
                image: 'assets/images/women_ring.png',
                label: 'Not Sure of Steeping Out',
                subTitle: 'Not Sure of Steeping Out',
                btnText: 'Book Now',
              ),
              const SizedBox(
                height: 15,
              ),
              const ListTileCard(
                image: 'assets/images/women_ring.png',
                label: 'Not Sure of Steeping Out',
                subTitle: 'Not Sure of Steeping Out',
                btnText: 'Book Now',
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Customer Testimonials',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20 * 3,
              ),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Rahul Desai',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          '5.0',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Image(
                      image: AssetImage('assets/images/ring2.png'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        '“Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor “',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        )))
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ]),
          )),
    );
  }

  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Do you really want to exit?',
          style: GoogleFonts.podkova(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              'NO',
              style: GoogleFonts.podkova(
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[900]),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => SystemNavigator.pop(),
            child: Text(
              'YES',
              style: GoogleFonts.podkova(
                textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[900]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
