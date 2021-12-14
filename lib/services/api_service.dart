import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sandeep_jwelery/models/login_response.dart';
import 'package:sandeep_jwelery/models/register_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  Future<LoginApiResponse> apiCallLogin(Map<String, dynamic> param) async {
    var url = Uri.parse(
        'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/login');
    var response = await http.post(url, body: param);

if (response.statusCode==200) {
   SharedPreferences prefs = await SharedPreferences.getInstance();
 prefs.setBool("isLoggedIn", true);
} else {
}
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode('DATA: ${response.body}');
    return LoginApiResponse(token: data["token"], error: data["error"]);
  }

  Future<RegisterApiResponse> apiCallRegister(
      Map<String, dynamic> param) async {
    var url = Uri.parse(
        'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/register');
    var response = await http.post(url, body: param);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode('DATA: ${response.body}');
    return RegisterApiResponse(status: data["status"], error: data["error"]);
  }
}