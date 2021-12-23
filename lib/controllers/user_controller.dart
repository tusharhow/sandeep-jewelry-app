import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sandeep_jwelery/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  Future<UserDetailsModel>? userModelFuture;
  var isLoading = true.obs;
  var userModel;
  var userData;
  var userNumber;

  Future<UserDetailsModel?> getUserDetails() async {
    isLoading(true);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userToken = prefs.getString('userToken');
    userNumber = prefs.getString('mobile');

    var url =
        "http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/details";
    var response = await http.post(Uri.parse(url), headers: {
      "Accept": "application/json",
      'Authorization': 'Bearer ' + userToken!,
    }, body: {
      "mobile_no": userNumber,
    });
    if (response.statusCode == 200) {
      var jsonString = response.body;
      userData = json.decode(jsonString);
      userModel = UserDetailsModel.fromJson(userData);
      print('////////////////////${response.body}');

      // var username = await FlutterKeychain.get(key: "pinkUserName");
      // print('Username: ${username}');
      // print('Profile Name Is: ${apiName}');
      print('///////// Response Is: ${userData}');
      // print(userData['success']['name']);

      // print('Profile Is: ${profileArr}');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // String userToken = token;

      prefs.setBool('user', true);
      prefs.setString('userToken', userToken);
      isLoading(false);
    } else {
      print('OTP sent failed');
      print(userData);
      // Create a flutter toast.
      Fluttertoast.showToast(
          msg: "OTP sent failed!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 20.0);
      isLoading(false);
    }
    return userModel;
  }

  @override
  void onInit() {
    super.onInit();
    userModelFuture = getUserDetails() as Future<UserDetailsModel>?;
  }
}
