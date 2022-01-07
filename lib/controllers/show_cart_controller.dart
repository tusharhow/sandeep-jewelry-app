// import 'dart:convert';
// import 'dart:math';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:sandeep_jwelery/config.dart';
// import 'package:sandeep_jwelery/models/show_cart_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ShowCartController extends GetxController{


//   var allParsedData;



//   var isLoading = true.obs;
//   Future<ShowCartModel>? allDataModelFuture;

//   Future<ShowCartModel> getAllCart() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     var token = prefs.getString('userToken');
//     try {
//       isLoading(true);
//       var url =
//           '${AppConfig.BASE_URL}/cartlist';

//       final response = await http.get(Uri.parse(url), headers: {
//         "Accept": "application/json",
//         "Authorization": "Bearer $token",
//       }, );
//       // print(" url call from " + url);
//       if (response.statusCode == 200) {
//         // print('url hit successful' + response.body);
//         var jsonString = response.body;
//         allParsedData = json.decode(jsonString);
//         update();
//         // fuckedData=       showCartModelFromJson(response.body);
//         print('Show Cart Data hit successful ' + '${allParsedData['data']}');
//         // print('My Fucked Data ${fuckedData}');
//         isLoading(false);
//       }isLoading(false);
//     } catch (e) {
//       print(e);
//       isLoading(false);
//     }
//     return allParsedData;
//   }


//   @override
//   void onInit() {
//     super.onInit();
//     allDataModelFuture = getAllCart() ;
// allParsedData = getAllCart();

//   }


// }