import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/collection_all_model.dart';
import 'package:sandeep_jwelery/models/mens_collection_model.dart';
import 'package:sandeep_jwelery/models/womens_collection_model.dart';

class CollectionController extends GetxController {
  var allParsedData;
  var allParsedModelData;
  var allWomensData;
  var allWomensModelData;
  var allMensData;
  var allMensModelData;
  var isLoading = true.obs;
  Future<CollectionAllModel>? allDataModelFuture;
  Future<WomensCollectionModel>? allWomensModelFuture;
  Future<MensCollectionModel>? allMensModelFuture;

  Future<CollectionAllModel> getAllCollection() async {
    try {
      isLoading(true);
      var url = '${AppConfig.BASE_URL}/collection';

      final response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
      }, body: {
        "collection": "",
      });
      // print(" url call from " + url);
      if (response.statusCode == 200) {
        // print('url hit successful' + response.body);

        allParsedData = json.decode(response.body);
        allParsedModelData = CollectionAllModel.fromJson(allParsedData);
        print('Collection Data hit successful ' + '${allParsedData}');
        // print(parsedData);
        isLoading(false);
      }
    } catch (e) {
      print(e);
    }
    return allParsedModelData;
  }

  Future<WomensCollectionModel> getWomensCollection() async {
    try {
      isLoading(true);
      var url = 'https://admin.sandeepjewellers.com/app/public/api/collection';

      final response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
      }, body: {
        "collection": "FeMale",
      });
      // print(" url call from " + url);
      if (response.statusCode == 200) {
        // print('url hit successful' + response.body);

        allWomensData = json.decode(response.body);
        allWomensModelData = WomensCollectionModel.fromJson(allWomensData);
        print('Collection Data hit successful ' + '${allWomensData}');
        // print(parsedData);
        isLoading(false);
      }
    } catch (e) {
      print(e);
    }
    return allWomensModelData;
  }

  Future<MensCollectionModel> getMensCollection() async {
    try {
      isLoading(true);
      var url = 'https://admin.sandeepjewellers.com/app/public/api/collection';

      final response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
      }, body: {
        "collection": "FeMale",
      });
      // print(" url call from " + url);
      if (response.statusCode == 200) {
        // print('url hit successful' + response.body);

        allMensData = json.decode(response.body);
        allMensModelData = MensCollectionModel.fromJson(allMensData);
        print('Collection Data hit successful ' + '${allMensData}');
        // print(parsedData);
        isLoading(false);
      }
    } catch (e) {
      print(e);
    }
    return allMensModelData;
  }

  @override
  void onInit() {
    super.onInit();
    allDataModelFuture = getAllCollection();
    allWomensModelFuture = getWomensCollection();
    allMensModelFuture = getMensCollection();
  }
}
