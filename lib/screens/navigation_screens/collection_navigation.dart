import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandeep_jwelery/components/appbar_primary.dart';
import 'package:sandeep_jwelery/components/house_of_collection_card.dart';
import 'package:sandeep_jwelery/components/list_card_vertical.dart';
import 'package:sandeep_jwelery/components/list_tile_card.dart';
import 'package:sandeep_jwelery/components/shop_carousel.dart';
import 'package:sandeep_jwelery/components/todays_deals_card.dart';
import 'package:sandeep_jwelery/data.dart';

class ShoppingPage extends StatefulWidget {
  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  final shoppingController = Get.put(ShoppingController());

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
              Category(),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return isListView
                      ? ListView.builder(
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) => Card(
                            color: Colors.white10,
                            margin: const EdgeInsets.symmetric(vertical: 8),
                            child: InkWell(
                              onTap: () {
                                print('clicked list');
                              },
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: 150,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                1.15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Image(
                                                image: AssetImage(controller
                                                    .products[index]
                                                    .productImage),
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
                                                  controller.products[index]
                                                      .productName,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      controller.products[index]
                                                          .priceLevel,
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 15),
                                                    ),
                                                    Text(
                                                      ' \$${controller.products[index].price.toInt()}',
                                                      textAlign:
                                                          TextAlign.justify,
                                                      style: const TextStyle(
                                                          color: Colors.white,
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
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            // childAspectRatio: 0.7,
                          ),
                          itemCount: controller.products.length,
                          itemBuilder: (BuildContext context, int index) {
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
                                  width:
                                      MediaQuery.of(context).size.width / 3.90,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
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
                                            image: AssetImage(controller
                                                .products[index].productImage),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                      Center(
                                        child: Text(
                                          controller
                                              .products[index].productName,
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
  Category({Key? key}) : super(key: key);

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
