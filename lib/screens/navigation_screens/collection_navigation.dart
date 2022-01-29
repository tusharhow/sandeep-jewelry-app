import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/controllers/collection_controllers.dart';
import 'package:sandeep_jwelery/models/collection_all_model.dart';
import 'package:sandeep_jwelery/models/mens_collection_model.dart';
import 'package:sandeep_jwelery/models/product_model.dart';
import 'package:sandeep_jwelery/models/shop_for_category.dart';
import 'package:sandeep_jwelery/models/womens_collection_model.dart';
import 'package:sandeep_jwelery/screens/category_details.dart';
import '../../config.dart';
import 'home_navigation.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  // final productController = Get.put(ProductController());

  bool isListView = true;
  bool isClicked = false;
  Future<ProductModel>? productList;
  var allParsedData;
  var allParsedModelData;
  // final collectionController = Get.put(ProductController());
  final collectionController = Get.put(CollectionController());
  Future<CollectionAllModel>? allDataModelFuture;
  @override
  void initState() {
    super.initState();
    // collectionController.getAllCollection();
    // collectionController.getWomensCollection();
    // collectionController.getMensCollection();
    allDataModelFuture = getAllCollection();
  }

  Future<CollectionAllModel> getAllCollection() async {
    try {
      var url = '${AppConfig.BASE_URL}/collection';

      final response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
      }, body: {
        "collection": "",
      });
      // print(" url call from " + url);
      if (response.statusCode == 200) {
        // print('url hit successful' + response.body);

        allParsedData = json.decode(response.body);
        allParsedModelData = CollectionAllModel.fromJson(allParsedData);
        print('Collection Data hit successful ' + '${allParsedData}');
        // print(parsedData);

      }
    } catch (e) {
      print(e);
    }
    return allParsedModelData;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: [
                  //       InkWell(
                  //         onTap: () {
                  //           setState(() {
                  //             if (isListView == true) {
                  //               isListView = false;
                  //             } else {
                  //               isListView = true;
                  //             }
                  //             setState(() {
                  //               if (isClicked == false) {
                  //                 isClicked = true;
                  //               } else {
                  //                 isClicked = false;
                  //               }
                  //             });
                  //           });
                  //         },
                  //         child: Image(
                  //           image: isClicked
                  //               ? const AssetImage('assets/icons/grid2.png')
                  //               : const AssetImage('assets/icons/list.png'),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // const Category(),

                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TabBar(
                      labelColor: Colors.white,
                      automaticIndicatorColorAdjustment: true,
                      indicatorColor: const Color(0xffFDD700),
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: [
                        Tab(
                          height: 40,
                          text: "All",
                        ),
                        Tab(
                          height: 40,
                          text: "Womens",
                        ),
                        Tab(
                          height: 40,
                          text: "Mens",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: TabBarView(children: [
                      // FutureBuilder<CollectionAllModel>(
                      //     future: allDataModelFuture,
                      //     builder: (context, snapshot) {
                      //       switch (snapshot.connectionState) {
                      //         case ConnectionState.none:
                      //         case ConnectionState.waiting:
                      //           return Center(
                      //             child: CircularProgressIndicator(),
                      //           );
                      //         default:
                      //           if (!snapshot.hasData) {
                      //             return Center(
                      //               child: CircularProgressIndicator(),
                      //             );
                      //           } else {
                      //             return SizedBox(
                      //               height: 800,
                      //               child: ListView.builder(
                      //                   itemCount: 1,
                      //                   itemBuilder: (context, index) {
                      //                     // var datas = collectionController
                      //                     //     .allParsedData['data'][index];

                      //                     // var url =
                      //                     //     'https://admin.sandeepjewellers.com/app/public/img/category/';
                      //                     // var img = url + datas['image'];
                      //                     // var catId = collectionController
                      //                     //         .allParsedData['data'][index]
                      //                     //     ['id'];
                      //                     return InkWell(
                      //                       onTap: () {
                      //                         // print(catId);

                      //                         // push(
                      //                         //     context: context,
                      //                         //     widget:
                      //                         //         CollectionDetailsScreen(
                      //                         //       catId: catId.toString(),
                      //                         //     ));
                      //                       },
                      //                       child: Card(
                      //                         margin: EdgeInsets.only(top: 15),
                      //                         color: Colors.white10,
                      //                         child: Row(
                      //                           children: [
                      //                             // Image(
                      //                             //   image: NetworkImage(img),
                      //                             //   height: 130,
                      //                             //   width: 130,
                      //                             // ),
                      //                             SizedBox(
                      //                               width: 20,
                      //                             ),
                      //                             Column(
                      //                               children: [
                      //                                 Text(
                      //                                   snapshot
                      //                                       .data!
                      //                                       .data[index]
                      //                                       .category
                      //                                       .toString(),
                      //                                   style: TextStyle(
                      //                                       color:
                      //                                           Colors.white),
                      //                                 ),
                      //                               ],
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     );
                      //                   }),
                      //             );
                      //           }
                      //       }
                      //     }),

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
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return SizedBox(
                                    height: 140,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              color: Colors.white10,
                                              child: Row(
                                                children: [
                                                  Image(
                                                    image: NetworkImage(img),
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    shopForController
                                                                .allParsedData[
                                                            'data'][index]
                                                        ['category'],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              )),
                                        );
                                      },
                                    ),
                                  );
                                }
                            }
                          }),

                      FutureBuilder<WomensCollectionModel>(
                          future: collectionController.allWomensModelFuture,
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              default:
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  return SizedBox(
                                    height: 140,
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
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
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              color: Colors.white10,
                                              child: Row(
                                                children: [
                                                  Image(
                                                    image: NetworkImage(img),
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text(
                                                    shopForController
                                                                .allParsedData[
                                                            'data'][index]
                                                        ['category'],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  )
                                                ],
                                              )),
                                        );
                                      },
                                    ),
                                  );
                                }
                            }
                          }),
                      FutureBuilder<WomensCollectionModel>(
                          future: collectionController.allWomensModelFuture,
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
                                  ));
                                } else {
                                  return SizedBox(
                                    height: 800,
                                    child: ListView.builder(
                                        itemCount: 1,
                                        itemBuilder: (context, index) {
                                          var datas = collectionController
                                              .allMensData['data'][index];

                                          // var fuck = snapshot.data!.data[index];
                                          var url =
                                              'https://admin.sandeepjewellers.com/app/public/img/category/';
                                          var img = url + datas['image'];
                                          return InkWell(
                                            onTap: () {
                                              print(datas['category']);
                                            },
                                            child: Card(
                                              margin: EdgeInsets.only(top: 15),
                                              color: Colors.white10,
                                              child: Row(
                                                children: [
                                                  Image(
                                                    image: NetworkImage(img),
                                                    height: 130,
                                                    width: 130,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        datas['category'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  );
                                }
                            }
                          }),
                    ]),
                  ),
                  // Expanded(
                  //   child: TabBarView(children: [
                  // Expanded(
                  //   child: isListView
                  //       ? FutureBuilder<ProductModel>(
                  //           future: collectionController.dataModelFuture,
                  //           builder: (context, snapshot) {
                  //             if (snapshot.hasData) {
                  //               return ListView.builder(
                  //                   itemCount: snapshot.data!.data.length,
                  //                   itemBuilder: (context, index) {
                  //                     var dataList =
                  //                         snapshot.data!.data[index];

                  //                     var img =
                  //                         '${snapshot.data!.url + '/' + dataList.image}';
                  //                     return Card(
                  //                       color: Colors.white10,
                  //                       margin: const EdgeInsets.symmetric(
                  //                           vertical: 8),
                  //                       child: InkWell(
                  //                         onTap: () {
                  //                           print('clicked list');
                  //                           // Navigator.push(
                  //                           //     context,
                  //                           // MaterialPageRoute(
                  //                           //   builder: (c) => const ProductDetailView(),
                  //                           //   settings: RouteSettings(
                  //                           //     arguments: dataList[index],
                  //                           //   ),
                  //                           // ));
                  //                         },
                  //                         child: Column(
                  //                           crossAxisAlignment:
                  //                               CrossAxisAlignment.center,
                  //                           children: [
                  //                             Stack(
                  //                               children: [
                  //                                 Container(
                  //                                   height: 150,
                  //                                   width:
                  //                                       MediaQuery.of(context)
                  //                                               .size
                  //                                               .width /
                  //                                           1.15,
                  //                                   decoration: BoxDecoration(
                  //                                     borderRadius:
                  //                                         BorderRadius
                  //                                             .circular(15),
                  //                                   ),
                  //                                   child: Row(
                  //                                     children: [
                  //                                       Padding(
                  //                                         padding:
                  //                                             const EdgeInsets
                  //                                                     .symmetric(
                  //                                                 horizontal:
                  //                                                     10),
                  //                                         child: Image(
                  //                                           image:
                  //                                               NetworkImage(
                  //                                                   img),
                  //                                         ),
                  //                                       ),
                  //                                       const SizedBox(
                  //                                         width: 20,
                  //                                       ),
                  //                                       Column(
                  //                                         crossAxisAlignment:
                  //                                             CrossAxisAlignment
                  //                                                 .center,
                  //                                         children: [
                  //                                           const SizedBox(
                  //                                             height: 50,
                  //                                           ),
                  //                                           Text(
                  //                                             dataList
                  //                                                 .productname,
                  //                                             textAlign:
                  //                                                 TextAlign
                  //                                                     .justify,
                  //                                             style: const TextStyle(
                  //                                                 color: Colors
                  //                                                     .white,
                  //                                                 fontSize:
                  //                                                     17),
                  //                                           ),
                  //                                           const SizedBox(
                  //                                             height: 10,
                  //                                           ),
                  //                                           Row(
                  //                                             children: [
                  //                                               Text(
                  //                                                 dataList
                  //                                                     .description,
                  //                                                 textAlign:
                  //                                                     TextAlign
                  //                                                         .center,
                  //                                                 maxLines: 1,
                  //                                                 textWidthBasis:
                  //                                                     TextWidthBasis
                  //                                                         .longestLine,
                  //                                                 style: const TextStyle(
                  //                                                     color: Colors
                  //                                                         .white,
                  //                                                     fontSize:
                  //                                                         13),
                  //                                               ),
                  //                                             ],
                  //                                           ),
                  //                                           const SizedBox(
                  //                                             height: 10,
                  //                                           ),
                  //                                           Text(
                  //                                             ' \$${dataList.amount}',
                  //                                             textAlign:
                  //                                                 TextAlign
                  //                                                     .justify,
                  //                                             style: const TextStyle(
                  //                                                 color: Colors
                  //                                                     .white,
                  //                                                 fontSize:
                  //                                                     17),
                  //                                           ),
                  //                                         ],
                  //                                       )
                  //                                     ],
                  //                                   ),
                  //                                 ),
                  //                               ],
                  //                             )
                  //                           ],
                  //                         ),
                  //                       ),
                  //                     );
                  //                   });
                  //             } else if (snapshot.hasError) {
                  //               return Text("${snapshot.error}");
                  //             }
                  //             return const Center(
                  //               child: CircularProgressIndicator(),
                  //             );
                  //           })
                  //       : FutureBuilder<ProductModel>(
                  //           future: collectionController.dataModelFuture,
                  //           builder: (context, snapshot) {
                  //             if (snapshot.hasData) {
                  //               return GridView.builder(
                  //                 gridDelegate:
                  //                     const SliverGridDelegateWithFixedCrossAxisCount(
                  //                   crossAxisCount: 2,
                  //                 ),
                  //                 itemCount: snapshot.data!.data.length,
                  //                 itemBuilder:
                  //                     (BuildContext context, int index) {
                  //                   var dataList = snapshot.data!.data[index];

                  //                   var img =
                  //                       '${snapshot.data!.url + '/' + dataList.image}';
                  //                   return InkWell(
                  //                     onTap: () {
                  //                       print('clicked grid');
                  //                     },
                  //                     child: Padding(
                  //                       padding:
                  //                           const EdgeInsets.only(top: 10),
                  //                       child: Card(
                  //                         elevation: 0.0,
                  //                         color: Colors.white10,
                  //                         semanticContainer: true,
                  //                         child: Container(
                  //                           height: 80,
                  //                           width: MediaQuery.of(context)
                  //                                   .size
                  //                                   .width /
                  //                               3.90,
                  //                           padding:
                  //                               const EdgeInsets.symmetric(
                  //                                   vertical: 15),
                  //                           decoration: BoxDecoration(
                  //                             borderRadius:
                  //                                 BorderRadius.circular(15),
                  //                           ),
                  //                           child: Column(
                  //                             children: [
                  //                               Container(
                  //                                 height: 100,
                  //                                 width: 100,
                  //                                 decoration: BoxDecoration(
                  //                                   image: DecorationImage(
                  //                                     image: NetworkImage(
                  //                                       img,
                  //                                     ),
                  //                                     fit: BoxFit.contain,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                               const SizedBox(height: 15),
                  //                               Center(
                  //                                 child: Text(
                  //                                   dataList.productname,
                  //                                   style: const TextStyle(
                  //                                     color: Colors.white,
                  //                                   ),
                  //                                   maxLines: 1,
                  //                                   overflow:
                  //                                       TextOverflow.ellipsis,
                  //                                 ),
                  //                               )
                  //                             ],
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   );
                  //                 },
                  //               );
                  //             } else if (snapshot.hasError) {
                  //               return Text("${snapshot.error}");
                  //             }
                  //             return const Center(
                  //               child: CircularProgressIndicator(),
                  //             );
                  //           }),
                  // ),

                  //
                  // Icon(Icons.home_filled),
                  // Icon(Icons.home_filled),
                  // Icon(
                  //   Icons.home_filled,
                  //   color: Colors.white,
                  // ),
                  //   ]),
                  // ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// class Category extends StatefulWidget {
//   const Category({Key? key}) : super(key: key);

//   @override
//   _CategoryState createState() => _CategoryState();
// }

// class _CategoryState extends State<Category> {
//   List<String> categories = ["All", "Mens", "Womens", "Kids"];

//   int selectedIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 40,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (context, index) => InkWell(
//           onTap: () {
//             setState(() {
//               selectedIndex = index;
//             });
//           },
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: _buildCategory(index),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildCategory(int index) {
//     return Container(
//       height: 45,
//       width: 70,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: selectedIndex == index
//             ? const Color(0xffFDD700)
//             : Colors.transparent,
//       ),
//       child: Center(
//         child: Text(
//           categories[index],
//           style: TextStyle(
//               color: selectedIndex == index ? Colors.black : Colors.white),
//         ),
//       ),
//     );
//   }
// }
