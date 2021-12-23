import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/search_model.dart';

class FetchUserList {
  var data = [];
  List<SearchModel> results = [];
  String urlList = '${AppConfig.BASE_URL}/filter_product';

  Future<List<SearchModel>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.post(url, body: {
        "search": query
      }, headers: {
        "Accept": "application/json",
      });

      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => SearchModel.fromJson(e)).toList();
        if (query != null) {
          results = data.contains(query.toLowerCase()) ? results : [];
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
