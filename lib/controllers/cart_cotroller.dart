import 'dart:convert';

import 'package:get/get.dart';
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/delete_cart_model.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartCotrollerIncreaments extends GetxController {


  var nameeees;
  names() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameeees = prefs.getInt('ffffffffff');
  }

  int addCartounter = 1;

  List<ShowCartModel> prods = [];

  // total prcice

  // total cart length
  int get totalCartLength => prods.length;

  var prodPrice;

  int get count => addCartounter;

  sharedItems() async {}

// get total price
  double get totalPrice => prods.fold(0, (prev, element) => prev + nameeees);

  void increments() {
    addCartounter++;
    update();
  }

  void decrements() {
    if (addCartounter > 1) {
      addCartounter--;
      update();
    }
  }

  var deleteData;
  Future<DeleteCartModel> deleteCartItems(String cartId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    try {
      var url = '${AppConfig.BASE_URL}/deletecart';

      final response = await http.post(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {
          "cart_id": cartId.toString(),
        },
      );

      if (response.statusCode == 200) {
        var jsonDeleteString = response.body;
        var allDeleteParsedData = json.decode(jsonDeleteString);

        deleteData = DeleteCartModel.fromJson(allDeleteParsedData);
        update();
      }
    } catch (e) {
      print(e);
    }
    return deleteData;
  }
  @override
  void onInit() {
    super.onInit();
    names();
    sharedItems();
  }
}
