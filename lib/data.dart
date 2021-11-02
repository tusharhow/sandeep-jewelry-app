import 'package:get/state_manager.dart';
import 'package:sandeep_jwelery/models/cm.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed((const Duration(seconds: 1)));
    var productResult = [
      Product(
        id: 1,
        price: 30,
        productDescription: 'some description about product',
        productImage: 'assets/images/ring2.png',
        productName: 'Kids Jewelry',
        priceLevel: 'Kids Jewelry',
      ),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'assets/images/ring2.png',
          priceLevel: 'Starting at ',
          productName: 'Womens Jewelry'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'assets/images/necklace2.png',
          priceLevel: 'Starting at ',
          productName: 'Mens Jewelry'),
      Product(
          id: 4,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'assets/images/ring2.png',
          priceLevel: 'Starting at ',
          productName: 'Kids Jewelry'),
      Product(
          id: 5,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'assets/images/necklace2.png',
          priceLevel: 'Starting at ',
          productName: 'iPhone 12'),
    ];

    products.value = productResult;
  }
}
