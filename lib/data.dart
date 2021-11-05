// import 'package:get/state_manager.dart';
// import 'package:sandeep_jwelery/models/cm.dart';

// class ShoppingController extends GetxController {
//   var products = <ProductModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProducts();
//   }

//   void fetchProducts() async {
//     await Future.delayed((const Duration(seconds: 1)));
//     var productResult = [
//       ProductModel(
//         id: 1,
//         price: 30,
//         productDescription: 'some description about product',
//         productImage: 'assets/images/ring2.png',
//         productName: 'Kids Jewelry',
//         priceLevel: 'Kids Jewelry',
//         // hsnCode: '',
//         // priceBreakdown: 522,
//       ),
//       ProductModel(
//           id: 2,
//           price: 40,
//           productDescription: 'some description about product',
//           productImage: 'assets/images/ring2.png',
//           priceLevel: 'Starting at ',
//           // hsnCode: '',
//           // priceBreakdown: 522,
//           productName: 'Womens Jewelry'),
//       ProductModel(
//           id: 3,
//           price: 49.5,
//           productDescription: 'some description about product',
//           productImage: 'assets/images/necklace2.png',
//           priceLevel: 'Starting at ',
//           // hsnCode: '',
//           // priceBreakdown: 522,
//           productName: 'Mens Jewelry'),
//       ProductModel(
//           id: 4,
//           price: 40,
//           productDescription: 'some description about product',
//           productImage: 'assets/images/ring2.png',
//           priceLevel: 'Starting at ',
//           // hsnCode: '',
//           // priceBreakdown: 522,
//           productName: 'Kids Jewelry'),
//       ProductModel(
//           id: 5,
//           price: 30,
//           productDescription: 'some description about product',
//           productImage: 'assets/images/necklace2.png',
//           priceLevel: 'Starting at ',
//           productName: 'iPhone 12',
//           // hsnCode: '',
//           // priceBreakdown: 522
//           ),
//     ];

//     products.value = productResult;
//   }
// }
