import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:sandeep_jwelery/models/login_response.dart';

class AuthRepository {
  // Future<LoginResponse> getLoginResponse(
  //     phone, String otpNumber) async {
  //   var post_body = jsonEncode({"email": "${phone}", "password": "$otpNumber"});

  //   final response = await http.post(Uri.parse("http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/login"),
  //       headers: {"Content-Type": "application/json"}, body: post_body);
  //   return loginResponseFromJson(response.body);
  // }

}
