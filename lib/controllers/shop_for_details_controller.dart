import 'dart:convert';

import 'package:get/get.dart';
import 'package:sandeep_jwelery/models/collection_details_model.dart';
import 'package:sandeep_jwelery/models/shop_for_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class ShopForDetailsController extends GetxController {
  var parsedDetailsData;
  var getValue;
  var shopDetailsModel;
  var isLoading = true.obs;

 Future<dynamic> fetchDetailsCategory(String val) async {
    try {
      isLoading(true);
      final response = await http
          .post(Uri.parse("${AppConfig.BASE_URL}/filter_product"), body: {
        "category_id": val,
      }, headers: {
        "Accept": "application/json"
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('shopforVal', val);
      getValue = prefs.getString('shopforVal');
      if (response.statusCode == 200) {
        // parsedDetailsData = jsonDecode(response.body);
        var map = json.decode(response.body);
        List<dynamic> data = map["data"];
        parsedDetailsData = data;
        // return  shopForCategoryDetailsModelFromJson(parsedDetailsData);
        print('Details Datasss: ${parsedDetailsData['data']}');

        isLoading(false);
      }
    } catch (e) {
      isLoading(false);
      print(e);
    }
    return parsedDetailsData;
  }

  @override
  void onInit() {
    super.onInit();
    // shopDetailsModel = fetchDetailsCategory(getValue);
    parsedDetailsData = fetchDetailsCategory(getValue);
  }
}
