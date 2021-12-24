import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/product_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsController extends GetxController {
  var parsedData;

  Future<ProductDetailsModel>? detailsModelFuture;
  Future<ProductDetailsModel> getProdCall(String prodId) async {
    var url =
        'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/product_detail';

    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
    }, body: {
      "product_id": prodId,
    });
    // print(" url call from " + url);
    if (response.statusCode == 200) {
      // print('url hit successful' + response.body);

      parsedData = json.decode(response.body);
      print('Data hit successful ' + '${parsedData['data']}');
      print('Fuck hit successful ' + '${parsedData['data']['category']}');
      print('prod name - ' + parsedData);
    } else {
      print('failed to get data');
      throw Exception('Failed to get data');
    }
    return parsedData;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   dataModelFuture = getProdCall();
  // }
}
