// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:get/get.dart';
// import 'package:sandeep_jwelery/models/cart_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CartController extends GetxController {
  // var parsedData;
//   var isLoading = true.obs;
//   var prodName;
//   var prodCount;
//   var prodSizee;
//   var prodeColor;
//   var prodPrice;
//   var prodId;

//   Future<CartModel>? dataModelFuture;
//   Future<CartModel> addToCart() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     var token = prefs.getString('userToken');
//     prodId = prefs.getString('proId');
//     prodName = prefs.getString('prodNam');
//     prodeColor = prefs.getString('prodColor');
//     prodCount = prefs.getString('prodCount');
//     prodPrice = prefs.getString('prodPrice');
//     prodSizee = prefs.getString('prodSize');

//     isLoading(true);
//     var url = 'https://admin.sandeepjewellers.com/app/public/cart';

//     final response = await http.post(Uri.parse(url), headers: {
//       "Accept": "application/json",
//       "Authorization": "Bearer $token",
//     }, body: {
//       "product_id": prodId,
//       "product_size": prodSizee,
//       "count": prodCount,
//       "selectedColor": prodeColor,
//       "jwellery_name": prodName,
//       "assests": ""
//     });
//     // print(" url call from " + url);
//     if (response.statusCode == 200) {
//       parsedData = json.decode(response.body);
//       print('cart Data hit successful ' + '${parsedData['data']}');
//       isLoading(false);
//     } else {
//       isLoading(true);
//       print('failed to get data');
//       throw Exception('Failed to get data');
//     }
//     return parsedData;
//   }

//   @override
//   void onInit() {
//     super.onInit();
//   }
// }
