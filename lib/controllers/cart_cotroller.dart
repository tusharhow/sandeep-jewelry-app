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

  // total cart length
  int get totalCartLength => prods.length;

  var prodPrice;

  int get count => counter;

  // double get totalPrice =>
  //     prods.fold(0, (sum, item) => sum * int.parse(item.data[1].amount) * 2);

  sharedItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("CountShared", counter.toString());
    prodPrice = prefs.getString('prodPrice');
  }

// Total price of the cart

  // cartData() {
  //   var fffff = print('OBJJJJJJJJJJJJJJJJJJJ${prods}');
  // }

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
