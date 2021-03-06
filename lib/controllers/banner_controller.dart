import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/banner_model.dart';

class BannerController extends GetxController {
  Future<BannerModel>? bannerModelFuture;

  var bannerModelData;

  var decodedData;
  var url = "${AppConfig.BASE_URL}/banner";
  Future<BannerModel> getBannerData() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;

        decodedData = json.decode(jsonString);
        bannerModelData = BannerModel.fromJson(decodedData);
        print(' $decodedData');
      }
    } catch (e) {
      print(e);
    }
    return bannerModelData;
  }

  @override
  void onInit() {
    super.onInit();
    bannerModelFuture = getBannerData();
  }

  // @override
  // void onReady() {

  //   super.onReady();
  //   bannerModelFuture = getBannerData();
  // }
}
