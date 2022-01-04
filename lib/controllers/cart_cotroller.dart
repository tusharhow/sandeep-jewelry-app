import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartCotrollerIncreaments extends GetxController {


  @override
  void onInit() {

    super.onInit();
    sharedItems();
  }

  int counter = 0;
  var products = [].obs;

  int get count => counter;

  double get totalPrice => products.fold(0, (sum, item) => sum + item.price);

  sharedItems()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    prefs.setString("CountShared", counter.toString());
  }


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
