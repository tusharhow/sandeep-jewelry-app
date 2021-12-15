// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:sandeep_jwelery/models/product_model.dart';

// class ProductControllerData {
//   var url =
//       'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/productlist';

//   Future<ProductModel> getData() async {
//     var response = await http.get(Uri.parse(url));
//     var dataBindings;

//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       var jsonMap = json.decode(jsonString);

//       dataBindings = ProductModel.fromJson(jsonMap);
//     }

//     return dataBindings;
//   }



// }


