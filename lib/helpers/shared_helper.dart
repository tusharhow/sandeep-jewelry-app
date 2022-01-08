// // import 'package:shared_value/shared_value.dart';

// import 'dart:convert';

// import 'package:api_cache_manager/models/cache_db_model.dart';
// import 'package:api_cache_manager/utils/cache_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:sandeep_jwelery/models/login_response.dart';
// import 'package:shared_value/shared_value.dart';

// final SharedValue<bool> is_logged_in = SharedValue(
//   value: false, // initial value
//   key: "is_logged_in", // disk storage key for shared_preferences
//   autosave: true, // autosave to shared prefs when value changes
// );

// final SharedValue<String> access_token = SharedValue(
//   value: "", // initial value
//   key: "access_token", // disk storage key for shared_preferences
//   autosave: true, // autosave to shared prefs when value changes
// );

// final SharedValue<int> user_id = SharedValue(
//   value: 0, // initial value
//   key: "user_id", // disk storage key for shared_preferences
//   autosave: true, // autosave to shared prefs when value changes
// );

// final SharedValue<String> avatar_original = SharedValue(
//   value: "", // initial value
//   key: "avatar_original", // disk storage key for shared_preferences
//   autosave: true, // autosave to shared prefs when value changes
// );

// final SharedValue<String> user_name = SharedValue(
//   value: "", // initial value
//   key: "user_name", // disk storage key for shared_preferences
//   autosave: true, // autosave to shared prefs when value changes
// );

// final SharedValue<String> user_phone = SharedValue(
//   value: "", // initial value
//   key: "user_number", // disk storage key for shared_preferences
//   autosave: true, // autosave to shared prefs when value changes
// );

// class SharedService {
//   static Future<bool> isLoggedIn() async {
//     var isCacheKeyExist =
//         await APICacheManager().isAPICacheKeyExist("login_details");

//     return isCacheKeyExist;
//   }

//   static Future<LoginApiResponse?> loginDetails() async {
//     var isCacheKeyExist =
//         await APICacheManager().isAPICacheKeyExist("login_details");

//     if (isCacheKeyExist) {
//       var cacheData = await APICacheManager().getCacheData("login_details");

//       if (cacheData != null) {
//         var jsonData = json.decode(cacheData.syncData);
//         return LoginApiResponse(
//             success: jsonData['success'],
//             status: jsonData['status'],
//             token: jsonData['token']);
//       }
//     }
//   }

//   static Future<void> setLoginDetails(
//     LoginApiResponse loginResponse,
//   ) async {
//     APICacheDBModel cacheModel = APICacheDBModel(
//       key: "login_details",
//       syncData: jsonEncode(loginResponse),
//     );

//     await APICacheManager().addCacheData(cacheModel);
//   }

//   static Future<void> logout(BuildContext context) async {
//     await APICacheManager().deleteCache("login_details");
//     Navigator.pushNamedAndRemoveUntil(
//       context,
//       '/login',
//       (route) => false,
//     );
//   }
// }
