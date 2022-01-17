import 'package:get/get.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartCotrollerIncreaments extends GetxController {
  @override
  void onInit() {
    super.onInit();
    names();
    sharedItems();
  }

  var nameeees;
  names() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameeees = prefs.getInt('ffffffffff');
  }

  int addCartounter = 1;

  List<ShowCartModel> prods = [];

 // total prcice
  
  // total cart length
  int get totalCartLength => prods.length;

  var prodPrice;

  int get count => addCartounter;

  sharedItems() async {}

// get total price
  double get totalPrice => prods.fold(0, (prev, element) => prev + nameeees);

  // add product to cart

  // add to cart

// update cart

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
    addCartounter++;
    update();
  }

  void decrements() {
    if (addCartounter > 1) {
      addCartounter--;
      update();
    }
  }
}
