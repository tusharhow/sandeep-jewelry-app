import 'package:get/get.dart';
import 'package:sandeep_jwelery/models/cart_model.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartCotrollerIncreaments extends GetxController {
  @override
  void onInit() {
    super.onInit();
    sharedItems();
  }

  int counter = 1;
  List<CartModel> products = [];
  var prodPrice;
  int get count => counter;

  String get totalPrice =>
      products.fold(0.toString(), (sum, item) => sum + item.count);

  sharedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("CountShared", counter.toString());
    prodPrice = prefs.getString('prodPrice');
  }

  void increments() {
    counter++;
    update();
  }

  void decrements() {
    if (counter > 1) {
      counter--;
      update();
    }
  }

  //  var cartItems = <Product>[].obs;

  // // int get count => cartItems.length;
  //
  // double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  // addToCart(Product product) {
  //   cartItems.add(product);
  // }

  // removeFromCart(Product product) {
  //   cartItems.remove(product);
  // }

}
