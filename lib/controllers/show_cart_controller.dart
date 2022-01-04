import 'dart:convert';
import 'dart:math';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowCartController extends GetxController{


  var allParsedData;
  var fuckedData;


  var isLoading = true.obs;
  Future<ShowCartModel>? allDataModelFuture;



  Future<ShowCartModel> getAllCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');
    try {
      isLoading(true);
      var url =
          'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/public/api/cartlist';

      final response = await http.get(Uri.parse(url), headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      }, );
      // print(" url call from " + url);
      if (response.statusCode == 200) {
        // print('url hit successful' + response.body);

        allParsedData = json.decode(response.body);
        fuckedData=       showCartModelFromJson(response.body);
        // print('Show Cart Data hit successful ' + '${allParsedData['data']}');
        print('My Fucked Data ${fuckedData}');
        isLoading(false);
      }isLoading(false);
    } catch (e) {
      print(e);
      isLoading(false);
    }
    return fuckedData;
  }


  @override
  void onInit() {
    super.onInit();
    // allDataModelFuture = getAllCart() ;
fuckedData = getAllCart();

  }


}