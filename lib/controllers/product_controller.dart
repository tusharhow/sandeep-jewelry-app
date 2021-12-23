import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/product_model.dart';


class ProductController extends GetxController {
  Future<ProductModel>? dataModelFuture;

  var dataModel;
  var url = "${AppConfig.BASE_URL}/productlist";
  Future<ProductModel> getData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      dataModel = ProductModel.fromJson(jsonMap);
      print("jsonMap\\\\\\: $jsonMap");

      var data = jsonMap['id'];

      // SharedPreferences prefs = await SharedPreferences.getInstance();

      // prefs.setString('product', data);

      print('Datas /////////// ${data}');
    } else {
      throw Exception('Failed to load data');
    }

    return dataModel;
  }

  @override
  void onInit() {
    super.onInit();
    dataModelFuture = getData();
  }
}
