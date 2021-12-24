import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sandeep_jwelery/models/collection_all_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  var parsedData;
  var isLoading = true.obs;
  Future<CollectionAllModel>? dataModelFuture;
  Future<CollectionAllModel> addCart(
      id, prodSize, count, color, jewellName, img) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    isLoading(true);
    var url =
        'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/cart';

    final response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      "Authorization": "Bearer $token",
    }, body: {
      "product_id": "1",
      "product_size": "9",
      "count": "1",
      "selectedColor": "red",
      "jwellery_name": "gold",
      "assests": "newtown"
    });
    // print(" url call from " + url);
    if (response.statusCode == 200) {
      // print('url hit successful' + response.body);

      parsedData = json.decode(response.body);
      print('Collection Data hit successful ' + '${parsedData}');
      // print(parsedData);
      isLoading(false);
    } else {
      isLoading(true);
      print('failed to get data');
      throw Exception('Failed to get data');
    }
    return parsedData;
  }
}
