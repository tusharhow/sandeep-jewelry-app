import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/controllers/product_controller.dart';
import 'package:sandeep_jwelery/models/product_model.dart';
import 'package:sandeep_jwelery/screens/navigation_screens/home_navigation.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({Key? key}) : super(key: key);

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  // final shoppingController = Get.put(ShoppingController());
  // final productController = Get.put(ProductController());

  bool isListView = true;
  bool isClicked = false;
  Future<ProductModel>? productList;

  final collectionController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    // productList = productController.fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (isListView == true) {
                              isListView = false;
                            } else {
                              isListView = true;
                            }
                            setState(() {
                              if (isClicked == false) {
                                isClicked = true;
                              } else {
                                isClicked = false;
                              }
                            });
                          });
                        },
                        child: Image(
                          image: isClicked
                              ? const AssetImage('assets/icons/grid2.png')
                              : const AssetImage('assets/icons/list.png'),
                        ),
                      ),
                    ],
                  ),
                ),
                // const Category(),

                TabBar(
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
                      text: "Mens",
                    ),
                    Tab(
                      height: 40,
                      text: "Womens",
                    ),
                    Tab(
                      height: 40,
                      text: "Kids",
                    ),
                  ],
                ),

                Expanded(
                  child: TabBarView(children: [
                    Expanded(
                      child: isListView
                          ? FutureBuilder<ProductModel>(
                              future: collectionController.dataModelFuture,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                      itemCount: snapshot.data!.data.length,
                                      itemBuilder: (context, index) {
                                        var dataList =
                                            snapshot.data!.data[index];

                                        var img =
                                            '${snapshot.data!.url + '/' + dataList.image}';
                                        return Card(
                                          color: Colors.white10,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 8),
                                          child: InkWell(
                                            onTap: () {
                                              print('clicked list');
                                              // Navigator.push(
                                              //     context,
                                              // MaterialPageRoute(
                                              //   builder: (c) => const ProductDetailView(),
                                              //   settings: RouteSettings(
                                              //     arguments: dataList[index],
                                              //   ),
                                              // ));
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      height: 150,
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              1.15,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        10),
                                                            child: Image(
                                                              image:
                                                                  NetworkImage(
                                                                      img),
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const SizedBox(
                                                                height: 50,
                                                              ),
                                                              Text(
                                                                dataList
                                                                    .productname,
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    dataList
                                                                        .description,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 1,
                                                                    textWidthBasis:
                                                                        TextWidthBasis
                                                                            .longestLine,
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            13),
                                                                  ),
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Text(
                                                                ' \$${dataList.amount}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .justify,
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        17),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              })
                          : FutureBuilder<ProductModel>(
                              future: collectionController.dataModelFuture,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    itemCount: snapshot.data!.data.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var dataList = snapshot.data!.data[index];

                                      var img =
                                          '${snapshot.data!.url + '/' + dataList.image}';
                                      return InkWell(
                                        onTap: () {
                                          print('clicked grid');
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: Card(
                                            elevation: 0.0,
                                            color: Colors.white10,
                                            semanticContainer: true,
                                            child: Container(
                                              height: 80,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.90,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          img,
                                                        ),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 15),
                                                  Center(
                                                    child: Text(
                                                      dataList.productname,
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                }
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }),
                    ),
                    Icon(Icons.home_filled),
                    Icon(Icons.home_filled),
                    Icon(
                      Icons.home_filled,
                      color: Colors.white,
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<String> categories = ["All", "Mens", "Womens", "Kids"];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _buildCategory(index),
          ),
        ),
      ),
    );
  }

  Widget _buildCategory(int index) {
    return Container(
      height: 45,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: selectedIndex == index
            ? const Color(0xffFDD700)
            : Colors.transparent,
      ),
      child: Center(
        child: Text(
          categories[index],
          style: TextStyle(
              color: selectedIndex == index ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
