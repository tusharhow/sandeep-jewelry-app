import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  Future<UserDetailsModel>? userModelFuture;
  var isLoading = true.obs;
  var userModel;
  var userData;
  var userNumber;

  Future<UserDetailsModel?> getUserDetails() async {
    try {
      isLoading(true);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userToken = prefs.getString('userToken');
      userNumber = prefs.getString('mobile');

      var url = "${AppConfig.BASE_URL}/details";
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
        // print('////////////////////${response.body}');

        // var username = await FlutterKeychain.get(key: "pinkUserName");
        // print('Username: ${username}');
        // print('Profile Name Is: ${apiName}');
        // print('///////// Response Is: ${userData}');
        // print(userData['success']['name']);

        // print('Profile Is: ${profileArr}');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // String userToken = token;

        prefs.setBool('user', true);
        // prefs.setString('userToken', userToken);
        isLoading(false);
      }
    } catch (e) {
      print(e);
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
