import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sandeep_jwelery/models/login_response.dart';
import 'package:sandeep_jwelery/models/register_response.dart';

class ApiServices {
  Future<LoginApiResponse> apiCallOtp(Map<String, dynamic> param) async {
    var url = Uri.parse(
        'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/otp/request');
    var response = await http.post(url, body: param);
    if (response.statusCode == 200) {
      Get.snackbar('OTP sent successfully', '',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.amber);

      print('OTP sent successfully');
    } else {
      Get.snackbar('Otp sent failed', 'Otp sent failed, Please try again..',
          snackPosition: SnackPosition.TOP, backgroundColor: Colors.amber);
    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode('DATA: ${response.body}');
    return LoginApiResponse(success: data["success"], status: data["status"]);
  }

  Future<LoginApiResponse> apiCallLogin(Map<String, dynamic> param) async {
    var url = Uri.parse(
        'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/login');
    var response = await http.post(url, body: param);
    if (response.statusCode == 200) {
      print('Login successfully');
    } else {
      print('Login failed');
    }
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    final data = jsonDecode('DATA: ${response.body}');
    return LoginApiResponse(success: data["success"], status: data["status"]);
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
