import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchController extends GetxController {
  TextEditingController controller = new TextEditingController();
  var searcModelFuture;
  var data;
  var value;
  Future<SearchModel> fetchData(String val) async {
    try {
      final response = await http
          .post(Uri.parse("${AppConfig.BASE_URL}/filter_product"), body: {
        "search": val,
      }, headers: {
        "Accept": "application/json"
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      value = prefs.setString('controllerFor', val);
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);

        // print('Search Data: ${data}');
      }
    } catch (e) {
      print(e);
    }
    return data;
  }

  @override
  void onInit() {
    super.onInit();
    searcModelFuture = fetchData(value);
  }
}
