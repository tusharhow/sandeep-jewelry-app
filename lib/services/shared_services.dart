import 'package:api_cache_manager/api_cache_manager.dart';

class SharedServices {
  static Future<bool> isLoggedIn() async {
    var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_key");
    return isKeyExist;
  }

  // static Future<LoginRequestModel?> loginDetails() async {
  //   var isKeyExist = await APICacheManager().isAPICacheKeyExist("login_key");
  //   if (isKeyExist) {
  //     var cachedata = await APICacheManager().getCacheData("login_key");

  //     return loginRequestModelFromJson(cachedata.syncData);
  //   }
  // }

  // static Future<void> setLoginDetails(LoginResponseModel model) async {
  //   APICacheDBModel cacheDBModel = APICacheDBModel(
  //     key: "login_key",
  //     syncData: jsonEncode(model.toJson()),
  //   );
  //   await APICacheManager().addCacheData(cacheDBModel);
  // }

  // static Future<void> logOut(BuildContext context) async {
  //   APICacheManager().deleteCache("login_key");
  //   Navigator.pushAndRemoveUntil(context,
  //       MaterialPageRoute(builder: (context) => VerifyOtp()), (route) => false);
  // }
}
