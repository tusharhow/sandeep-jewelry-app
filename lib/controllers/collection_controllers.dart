import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/models/collection_all_model.dart';

class CollectionController extends GetxController {
  var parsedData;
  var isLoading = true.obs;
  Future<CollectionAllModel>? dataModelFuture;
  Future<CollectionAllModel> getAllCollection() async {
    try {
      isLoading(true);
      var url =
          'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/public/api/collection';

      final response = await http.post(Uri.parse(url), headers: {
        "Accept": "application/json",
      }, body: {
        "collection": "",
      });
      // print(" url call from " + url);
      if (response.statusCode == 200) {
        // print('url hit successful' + response.body);

        parsedData = json.decode(response.body);
        print('Collection Data hit successful ' + '${parsedData}');
        // print(parsedData);
        isLoading(false);
      }
    } catch (e) {
      print(e);
    }
    return parsedData;
  }

  @override
  void onInit() {
    super.onInit();
    dataModelFuture = getAllCollection();
  }
}
