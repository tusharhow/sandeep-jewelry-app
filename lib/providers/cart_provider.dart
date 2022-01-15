import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sandeep_jwelery/models/delete_cart_model.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../config.dart';

class CartProvider extends ChangeNotifier {
  List<ShowCartModel> cartList = [];
  var cart = List<ShowCartModel>.empty(growable: true);

  get cartListLength {
    notifyListeners();
    return cartList.length;
  }
// sumCart (){
//   return cart.map((e) => int.parse(e.data.length)).reduce((a,b) => a+b);
// }
  // get total price
  // double get totalPrice =>
  //     cartList.fold(0, (sum, item) => sum * int.parse(item.data[0].amount) * 2);

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
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
    return deleteData;
  }

}
