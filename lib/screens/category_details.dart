import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/models/shop_for_details.dart';

import '../config.dart';
import 'category_products_details.dart';

// ignore: must_be_immutable
class CategoryDetails extends StatefulWidget {
  CategoryDetails({Key? key, required this.varId}) : super(key: key);

  String varId;

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

var shopForModel;

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    super.initState();
    shopDetailsModel = shopForFuck();
  }

  Future<ShopForCategoryDetailsModel>? shopDetailsModel;

  Future<ShopForCategoryDetailsModel> shopForFuck() async {
    try {
      final response = await http
          .post(Uri.parse("${AppConfig.BASE_URL}/filter_product"), body: {
        "category_id": widget.varId.toString(),
      }, headers: {
        "Accept": "application/json"
      });

      if (response.statusCode == 200) {
        setState(() {
          var modelData = jsonDecode(response.body);
          shopForModel = ShopForCategoryDetailsModel.fromJson(modelData);
        });
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
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Category',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          FutureBuilder<ShopForCategoryDetailsModel>(
              future: shopDetailsModel,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data!.data.length,
                        itemBuilder: (context, index) {
                          var datas = snapshot.data!.data[index];

                          var url =
                              'https://admin.sandeepjewellers.com/app/public/img/product/';
                          var img = url + datas.images[0];
                          var prodId = datas.productId;

                          return InkWell(
                            onTap: () {
                              push(
                                context: context,
                                widget: CategoryProductsDetails(
                                  prodId: prodId.toString(),
                                  size: datas.priceType,
                                  color: datas.jewelleryColor.toString(),
                                  prodName: datas.jwelleryName,
                                ),
                              );
                            },
                            child: Card(
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
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data!.data[index].jwelleryName
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '₹ ${snapshot.data!.data[index].amount}'
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
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
              }),
        ],
      ),
    );
  }
}
