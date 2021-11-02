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

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Expanded(
                child: GetX<ShoppingController>(builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) => Card(
                      color: Colors.white10,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 1.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Image(
                                        image: AssetImage(controller
                                            .products[index].productImage),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Text(
                                          controller
                                              .products[index].productName,
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
                                              controller
                                                  .products[index].priceLevel,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17),
                                            ),
                                            Text(
                                              controller.products[index].price
                                                  .toString(),
                                              textAlign: TextAlign.justify,
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
