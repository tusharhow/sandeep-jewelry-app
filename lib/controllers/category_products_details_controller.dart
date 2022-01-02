import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/models/category_products_details_model.dart';
import 'package:sandeep_jwelery/models/product_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryProductDetailsController extends GetxController {
  var parsedData;
  var sharedString;

  Future<CategoryProductsDetailsModel>? detailsModelFuture;
  Future<CategoryProductsDetailsModel> getProdCall(String prodId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('proId', prodId);

    sharedString = prefs.getString('proId');

    try {
      var url =
          'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/public/api/product_detail';

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
      }
    } catch (e) {
      print(e);
    }
    return parsedData;
  }

  @override
  void onInit() {
    super.onInit();
    detailsModelFuture = getProdCall(sharedString);
  }

  @override
  void onReady() {
    super.onReady();
    detailsModelFuture = getProdCall(sharedString);
  }
}
