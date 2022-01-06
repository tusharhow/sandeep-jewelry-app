import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/collection_all_model.dart';
import 'package:sandeep_jwelery/models/mens_collection_model.dart';
import 'package:sandeep_jwelery/models/shop_for_category.dart';

class ShopForController extends GetxController {
  var allParsedData;

  var isLoading = true.obs;
  Future<ShopForCategoryModel>? allDataModelFuture;

  Future<ShopForCategoryModel?> getAllCategory() async {
    try {
      isLoading(true);
      var url =
          '${AppConfig.BASE_URL}/category/list';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
        },
      );
      // print(" url call from " + url);
      if (response.statusCode == 200) {
        // print('url hit successful' + response.body);

        allParsedData = json.decode(response.body);
        print('Collection Data hit successful ' + '${allParsedData}');
        // print(parsedData);
        return ShopForCategoryModel.fromJson(allParsedData);
      } else {
        print('url hit failed' + response.body);
        // return ShopForCategoryModel.fromJson(allParsedData);
      }
    } catch (e) {
      print(e);
      isLoading(false);
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    allDataModelFuture = getAllCategory() as Future<ShopForCategoryModel>?;
    allParsedData = getAllCategory();
  }
}
