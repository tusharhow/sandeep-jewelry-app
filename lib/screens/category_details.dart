import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/controllers/shop_for_details_controller.dart';
import 'package:sandeep_jwelery/models/shop_for_details.dart';

import 'category_products_details.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({Key? key, required this.varId}) : super(key: key);

  String varId;

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

var shopForDetailsController = Get.put(ShopForDetailsController());

var fuckk = Get.put(ShopForDetailsController());

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    super.initState();

    shopForDetailsController.fetchDetailsCategory(widget.varId);
    // fuckk.parsedDetailsData;
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Category',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // body: Container(
      //   child: FutureBuilder<ShopForCategoryDetailsModel>(
      //       future: shopForDetailsController.shopDetailsModel,
      //       builder: (context, snapshot) {
      // switch (snapshot.connectionState) {
      //   // case ConnectionState.none:
      //   // case ConnectionState.waiting:
      //   //   return Center(
      //   //     child: CircularProgressIndicator(),
      //   //   );
      //
      //   default:
      //     if (snapshot.hasError) {
      //       return Container(
      //         child: Text(
      //           snapshot.error.toString(),
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       );
      //     } else {
      //       return SizedBox(
      //         height: 600,
      //         child: ListView.builder(
      //             itemCount: 2,
      //             itemBuilder: (context, index) {
      //               // var datas = shopForDetailsController
      //               //         .parsedDetailsData['data'][index]
      //               //     ['feature_img'];
      //               // var img =
      //               //     '${shopForDetailsController.parsedDetailsData['url'] + '/' + datas}';
      //               // var prodId = shopForDetailsController
      //               //         .parsedDetailsData['data'][index]
      //               //     ['product_id'];
      //               return InkWell(
      //                 onTap: () {
      //                   push(
      //                       context: context,
      //                       widget: CategoryProductsDetails(
      //                         prodId: 2.toString(),
      //                       ));
      //                 },
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(top: 10),
      //                   child: Card(
      //                     color: Colors.white10,
      //                     child: Row(
      //                       children: [
      //                         // Image(
      //                         //       image: NetworkImage(img),
      //                         //       height: 150,
      //                         //       width: 150,
      //                         //     ),
      //
      //                         // Padding(
      //                         //   padding: const EdgeInsets.symmetric(
      //                         //       horizontal: 20),
      //                         //   child: Text(
      //                         //     shopForDetailsController
      //                         //         .parsedDetailsData['data']
      //                         //             [index]['jwellery_name']
      //                         //         .toString(),
      //                         //     textAlign: TextAlign.justify,
      //                         //     style: const TextStyle(
      //                         //         color: Colors.white,
      //                         //         fontSize: 17),
      //                         //   ),
      //                         // ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             }),
      //       );
      //     }
      // }

      // }),

      // ));
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () {
                if (shopForDetailsController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else
                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          var datas =
                              shopForDetailsController.parsedDetailsData[index];
                          var url =
                              'https://admin.sandeepjewellers.com/app/public/img/product/';
                          var img = url +
                              shopForDetailsController.parsedDetailsData[index]
                                  ['feature_img'];
                          var prodId = datas['product_id'];
                          return InkWell(
                            onTap: () {
                              push(
                                  context: context,
                                  widget: CategoryProductsDetails(
                                      prodId: prodId.toString()));
                            },
                            child: Card(
                              color: Colors.white10,
                              child: Row(
                                children: [
                                  Image(
                                    image: NetworkImage(img),
                                    height: 150,
                                    width: 150,
                                  ),
                                  Text(
                                    datas['productname'],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
