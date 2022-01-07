// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:sandeep_jwelery/models/shop_for_details.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import '../config.dart';

// class ShopForDetailsController extends GetxController {
//   // List parsedDetailsData = [];
//   var getValue;
  // Future<ShopForCategoryDetailsModel>? shopDetailsModel;
//   var isLoading = true.obs;
//   var shopForModel;

//   Future<ShopForCategoryDetailsModel?> fetchDetailsCategory(String val) async {
//     try {
//       isLoading(true);
//       final response = await http
//           .post(Uri.parse("${AppConfig.BASE_URL}/filter_product"), body: {
//         "category_id": val,
//       }, headers: {
//         "Accept": "application/json"
//       });

//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       prefs.setString('shopforVal', val);
//       getValue = prefs.getString('shopforVal');
//       if (response.statusCode == 200) {
//         // parsedDetailsData = jsonDecode(response.body);
//         // var map = json.decode(response.body);
//         // List<dynamic> data = map["data"];
//         // parsedDetailsData = data;
//         var modelData = jsonDecode(response.body);
//         shopForModel = ShopForCategoryDetailsModel.fromJson(modelData);
//         // print('Details Datasss: ${parsedDetailsData['data']}');

//         isLoading(false);
//       }
//     } catch (e) {
//       isLoading(false);
//       print(e);
//     }
//     return shopForModel;
//   }

//   @override
//   void onInit() {
//     super.onInit();
//     shopDetailsModel =
//         fetchDetailsCategory(getValue) as Future<ShopForCategoryDetailsModel>?;
//     // parsedDetailsData = fetchDetailsCategory(getValue) ;
//   }
// }
