import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/banner_model.dart';
import 'package:sandeep_jwelery/models/product_model.dart';

class BannerController extends GetxController {
  Future<BannerModel>? bannerModelFuture;

  var decodedData;
  var url = "${AppConfig.BASE_URL}/banner";
  Future<BannerModel> getBannerData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;

      decodedData = json.decode(jsonString);
      print(' $decodedData');
    }

    return decodedData;
  }

  @override
  void onInit() {
    super.onInit();
    bannerModelFuture = getBannerData();
  }

  // @override
  // void onReady() {
  //   // TODO: implement onReady
  //   super.onReady();
  //   bannerModelFuture = getBannerData();
  // }
}
