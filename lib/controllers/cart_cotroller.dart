import 'dart:convert';

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
  // List<CartModel> products = [];
  List<ShowCartModel> prods = [];
  var prodPrice;
  int get count => counter;

  sharedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("CountShared", counter.toString());
    prodPrice = prefs.getString('prodPrice');
  }

// Total products price

  //  var cartItems = <Product>[].obs;

  // // int get count => cartItems.length;
  //

  // addToCart(Product product) {
  //   cartItems.add(product);
  // }

  // removeFromCart(Product product) {
  //   cartItems.remove(product);
  // }

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
}
