// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:sandeep_jwelery/config.dart';
// import 'package:sandeep_jwelery/models/category_products_details_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CategoryProductDetailsController extends GetxController {
//   var parsedData;
//   var sharedString;

//   Future<CategoryProductsDetailsModel>? detailsModelFuture;
//   Future<CategoryProductsDetailsModel> getProdCall() async {
//     try {
//       var url = '${AppConfig.BASE_URL}/product_detail';

//       final response = await http.post(Uri.parse(url), headers: {
//         "Accept": "application/json",
//       }, body: {
//         "product_id": prodId.toString(),
//       });
//       // print(" url call from " + url);
//       if (response.statusCode == 200) {
//         // print('url hit successful' + response.body);

//         parsedData = json.decode(response.body);
//         print('Data hit successful ' + '${parsedData['data']}');

//         print('prod name - ' + parsedData);
//       }
//     } catch (e) {
//       print(e);
//     }
//     return parsedData;
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     detailsModelFuture = getProdCall();
//   }


// }
