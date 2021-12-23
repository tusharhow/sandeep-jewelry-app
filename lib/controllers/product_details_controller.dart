import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/product_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class ProductDetailsController extends GetxController {
//   Future<ProductDetailsModel>? dataModelFuture;
//   var datamodel;
//   // product details function
//   Future<ProductDetailsModel> ProductDetails() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     var id = prefs.getString('prodDetailsId');
//     var response = await http.post(
//       Uri.parse(
//         "${AppConfig.BASE_URL}/product_detail",
//       ),
//       headers: {
//         "Accept": "application/json",
//       },
//       body: {
//         "product_id": id,
//       },
//     );

//     if (response.statusCode == 200) {
//       var jsonResponse = json.decode(response.body);

//       datamodel = ProductDetailsModel.fromJson(jsonResponse);

//       print('Data//.../////.///${response.body}');
//       print('Data Two//.../////.///${datamodel.data.product_name}');
//     } else {
//       throw Exception('Failed to load post');
//     }
//     return datamodel;
//   }

//   @override
//   void onInit() {
//     super.onInit();

//   }
// }

//   Future getProductDetails(int prodId) async {
//   var url =
//       "http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/product_detail";
//   var response = await http.post(Uri.parse(url), body: {
//     "product_id": prodId,
//   });
//   if (response.statusCode == 200) {
//     print('OTP Validation successfully');
//     Map<String, dynamic> resposne = jsonDecode(response.body);
//     Map<String, dynamic> user = resposne['token'];
//     print('User: $user');
//     // savePref(, email, widget.phoneNumber);

//   } else {
//     print('OTP Validation failed');
//     // Create a flutter toast.
//     Fluttertoast.showToast(
//         msg: "OTP Validation failed!",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.blue,
//         textColor: Colors.white,
//         fontSize: 20.0);
//   }
// }

class ProductDetailsController extends GetxController {
  var baseurl = "http://androidtutorial.blueappsoftware.com//";

// see complete url --
// http://androidtutorial.blueappsoftware.com/webapi/get_jsondata.php
  Future<ProductDetailsModel> getProdCall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var url = '${AppConfig.BASE_URL}/product_detail';
    var id = prefs.getString('prodDetailsId');

    final body = {
      "product_id": id,
    };
    final bodyjson = json.encode(body);
    // pass headers parameters if any
    final response = await http.post(Uri.parse(url),
        headers: <String, String>{
          "Accept": "application/json",
        },
        body: bodyjson);
    print(" url call from " + url);
    if (response.statusCode == 200) {
      print('url hit successful' + response.body);
      String data = response.body;
      print(' prod name - ' + jsonDecode(data));
      return ProductDetailsModel.fromJson(json.decode(response.body));
    } else {
      print('failed to get data');
      throw Exception('Failed to get data');
    }
  }
}

//   Future getProductDetails(int prodId) async {
//   var url =
//       "http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/product_detail";
//   var response = await http.post(Uri.parse(url), body: {
//     "product_id": prodId,
//   });
//   if (response.statusCode == 200) {
//     print('OTP Validation successfully');
//     Map<String, dynamic> resposne = jsonDecode(response.body);
//     Map<String, dynamic> user = resposne['token'];
//     print('User: $user');
//     // savePref(, email, widget.phoneNumber);

//   } else {
//     print('OTP Validation failed');
//     // Create a flutter toast.
//     Fluttertoast.showToast(
//         msg: "OTP Validation failed!",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.blue,
//         textColor: Colors.white,
//         fontSize: 20.0);
//   }
// }
