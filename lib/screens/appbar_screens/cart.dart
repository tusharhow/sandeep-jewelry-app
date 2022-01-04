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
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text('Cart',  style: TextStyle(


            color: Colors.white, fontWeight: FontWeight.w900),),
      ),
      body: Column(
        children: [
          
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
                            itemCount: 7,
                            itemBuilder: (context, index) {
                              // var datas = showCartController.allParsedData[index];
                              // var fuck = showCartController.fuckedData[index];
                              var img = showCartController.allParsedData['url']+'/'+showCartController.allParsedData['data'][index]['image'];
                              // print('Fuckkinh ${img}');
                              return Card(
                                color: Colors.white10,
                                child: Row(
                                  children: [
                                    Image(image: NetworkImage(img),height: 120,width: 120,),

                                    Column(
                                      children: [
                                        Text(
                                         showCartController.allParsedData['data'][index]['productName'].toString(),
                                          style: TextStyle(color: Colors.white,fontSize: 20),
                                        ),
                                        Text(
                                          showCartController.allParsedData['data'][index]['amount'].toString(),
                                          style: TextStyle(color: Colors.white,fontSize: 18),
                                        ),
                                      ],
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
