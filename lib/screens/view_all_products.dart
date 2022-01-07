import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/todays_deals_card.dart';
import 'package:sandeep_jwelery/controllers/product_controller.dart';
import 'package:sandeep_jwelery/models/product_model.dart';
import 'package:sandeep_jwelery/screens/product_details.dart';

class ViewAllProducts extends StatelessWidget {
  ViewAllProducts({Key? key}) : super(key: key);
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            'View All Products',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder<ProductModel>(
                    future: productController.dataModelFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 800,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data!.data.length,
                              itemBuilder: (context, index) {
                                var datas = snapshot.data!.data[index];

                                var url =
                                    'https://admin.sandeepjewellers.com/app/public/img/product/';
                                var img = '${url + datas.image}';

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (c) => ProductDetailView(
                                          prodId: datas.id.toString(),
                                          img: img,
                                          color: datas.color,
                                          prodName: datas.jwelleryName,
                                          size: datas.defaultSize,
                                          items: datas.defaultSize,
                                          prodPrice: datas.amount,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    elevation: 0,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
