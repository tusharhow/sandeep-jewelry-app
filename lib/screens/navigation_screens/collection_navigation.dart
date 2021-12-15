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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const Category(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: isListView
                    ? FutureBuilder<ProductModel>(
                        future: productController.dataModelFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                                itemCount: snapshot.data!.products.length,
                                itemBuilder: (context, index) {
                                  var dataList = snapshot.data!.products[index];
                                  return Card(
                                    color: Colors.white10,
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
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
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                height: 150,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    1.15,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 10),
                                                      child: Image(
                                                        image: NetworkImage(
                                                            dataList.image),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 25,
                                                    ),
                                                    Column(
                                                      children: [
                                                        const SizedBox(
                                                          height: 50,
                                                        ),
                                                        Text(
                                                          dataList.title,
                                                          textAlign:
                                                              TextAlign.justify,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 17),
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
                                                                      .justify,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 15),
                                                            ),
                                                            Text(
                                                              ' \$${dataList.amount}',
                                                              textAlign:
                                                                  TextAlign
                                                                      .justify,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 17),
                                                            ),
                                                          ],
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
                        future: productController.dataModelFuture,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                              itemCount: snapshot.data!.products.length,
                              itemBuilder: (BuildContext context, int index) {
                                var dataList = snapshot.data!.products[index];
                                return InkWell(
                                  onTap: () {
                                    print('clicked grid');
                                  },
                                  child: Card(
                                    elevation: 0.0,
                                    color: Colors.white10,
                                    semanticContainer: true,
                                    child: Container(
                                      height: 80,
                                      width: MediaQuery.of(context).size.width /
                                          3.90,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 100,
                                            width: 100,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    dataList.image),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 15),
                                          Center(
                                            child: Text(
                                              dataList.title,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          )
                                        ],
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
            ],
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
