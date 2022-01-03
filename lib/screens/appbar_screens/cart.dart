import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/controllers/add_cart_controller.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}
final cartController = Get.put(CartController());
class _CartPageState extends State<CartPage> {
  @override
  void initState() {

    super.initState();
    cartController.addToCart();
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
                if (cartController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else
                  return SizedBox(
                    height: 150,
                    child: ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          var datas = cartController.parsedData[index];
                          var img = cartController.parsedData['url']+'/'+cartController.parsedData[index]['feature_img'];
                          print('Fuckkinh ${img}');
                          return Card(
                            color: Colors.white10,
                            child: Row(
                              children: [
                                Image(image: NetworkImage(img),height: 150,width: 150,),
                                Text(
                                  datas['productname'],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          );
                        }
                    ),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
