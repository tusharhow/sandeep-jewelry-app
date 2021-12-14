import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/models/product_model.dart';

class ProductController extends GetxController {
  Future<ProductModel>? dataModelFuture;

  var dataModel;
  var url = "http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/productlist";
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
