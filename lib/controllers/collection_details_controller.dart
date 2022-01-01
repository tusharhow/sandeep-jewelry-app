import 'dart:convert';

import 'package:get/get.dart';
import 'package:sandeep_jwelery/models/collection_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class CollectionDetailsController extends GetxController{

var data;
var getValue;
var parsedData;
var collectionDetailsModel;

  Future<CollectionDetailsModel> fetchData(String val) async {
    try {
      final response = await http
          .post(Uri.parse("${AppConfig.BASE_URL}/filter_product"), body: {
        "category_id":val,
      }, headers: {
        "Accept": "application/json"
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('collectionVal', val);
      getValue = prefs.getString('collectionVal');
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);

        print('Details Data: ${data['data']}');
      }
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  void onInit() {
    super.onInit();
    collectionDetailsModel = fetchData(getValue);
  }
}