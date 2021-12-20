import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/product_details_model.dart';
import 'package:sandeep_jwelery/models/product_model.dart';

class ProductDetailsController extends GetxController {
  // product details function
  Future<ProductDetailsModel> getProductDetails(String productId) async {
    var response = await http.get(
      Uri.parse("${AppConfig.BASE_URL}/product_detail/$productId"),
      headers: {
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      ProductDetailsModel productDetailsModel =
          ProductDetailsModel.fromJson(jsonResponse);
      print('Details printed: ${response.body}');
      return productDetailsModel;
    } else {
      throw Exception('Failed to load post');
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
