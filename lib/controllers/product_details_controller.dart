import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/product_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsController extends GetxController {
  var parsedData;
  var sharedString;

  Future<ProductDetailsModel>? detailsModelFuture;
  Future<ProductDetailsModel?> getProdCall(String prodId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('proId', prodId);

    sharedString = prefs.getString('proId');

    try {
      var url = '${AppConfig.BASE_URL}/product_detail';

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
        },
        body: jsonEncode(<String, String>{
          "product_id": prodId,
        }),
      );
      // print(" url call from " + url);
      if (response.statusCode == 200) {
        // print('url hit successful' + response.body);

        parsedData = json.decode(response.body);
        print('Data hit successful ' + '${parsedData['data']}');
        print(' hit successful ' + '${parsedData['data']['category']}');

        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("prodNam", parsedData['data']['productname']);
        prefs.setString("prodPrice", parsedData['data']['amount']);
        prefs.setString("prodCount", 2.toString());
        prefs.setString("prodColor", parsedData['data']['jewellery_color']);
        prefs.setString("prodSize", parsedData['data']['jewellery_size']);

        return parsedData;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    // detailsModelFuture = getProdCall(sharedString);
    // parsedData = getProdCall(sharedString);
    detailsModelFuture =
        getProdCall(sharedString) as Future<ProductDetailsModel>?;
  }
}
