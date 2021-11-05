import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/models/cm.dart';

class ProductController extends GetxController {
  Future<ProductModel>? dataModelFuture;

  var dataModel;
  var url = "https://api.npoint.io/91c8be8911891aabcf8d";
  Future<ProductModel> getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      dataModel = ProductModel.fromJson(jsonMap);
    } else {
      throw Exception('Failed to load data');
    }

    return dataModel;
  }

  @override
  void onInit() {
    dataModelFuture = getData();
    super.onInit();
  }
}
