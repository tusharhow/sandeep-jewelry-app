import 'package:get/get.dart';


class CartCotroller extends GetxController {
  int counter = 0;
  void increments() {
    counter++;
    update();
  }

  void decrements() {
    if (counter == 0) {
      counter = 1;
    } else {
      counter--;
      update();
    }
  }

  //  var cartItems = <Product>[].obs;

  // int get count => cartItems.length;

  // double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);

  // addToCart(Product product) {
  //   cartItems.add(product);
  // }

  // removeFromCart(Product product) {
  //   cartItems.remove(product);
  // }
}
