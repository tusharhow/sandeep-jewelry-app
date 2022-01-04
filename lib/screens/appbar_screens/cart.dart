import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/controllers/add_cart_controller.dart';
import 'package:sandeep_jwelery/controllers/show_cart_controller.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}
final showCartController = Get.put(ShowCartController());
class _CartPageState extends State<CartPage> {
  @override
  void initState() {

    super.initState();
    showCartController.getAllCart();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    "ShopMe",
                    style: TextStyle(
                        fontFamily: "avenir",
                        fontSize: 32,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
                  () {
                if (showCartController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else
                  return FutureBuilder<ShowCartModel>(
                    future: showCartController.allDataModelFuture,
                    builder: (context, snapshot) {
                      return SizedBox(
                        height: 150,
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              var datas = showCartController.allParsedData[index];
                              // var img = showCartController.allParsedData['url']+'/'+showCartController.allParsedData[index]['feature_img'];
                              // print('Fuckkinh ${img}');
                              return Card(
                                color: Colors.white10,
                                child: Row(
                                  children: [
                                    // Image(image: NetworkImage(img),height: 150,width: 150,),
                                    Text(
                                      showCartController.fuckedData.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              );
                            }
                        ),
                      );
                    }
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
