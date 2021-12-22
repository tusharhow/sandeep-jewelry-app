import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/components/additional_options_listview.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/controllers/user_controller.dart';
import 'package:sandeep_jwelery/models/profile_model.dart';
import 'package:sandeep_jwelery/screens/auth/verify_otp.dart';
import 'package:sandeep_jwelery/screens/profile_edit.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/screens/track_order.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({Key? key}) : super(key: key);

  @override
  State<ProfileNavigation> createState() => _ProfileNavigationState();
}

String? fullName;
String? emailFull;
String? mobileNo;
String? userToken;

String? authUser;
var profileArr;
bool? _profileLoad;

var apiName;
var userData;

SharedPreferences? sharedPreferences;

final userController = Get.put(UserController());

class _ProfileNavigationState extends State<ProfileNavigation> {
  @override
  void initState() {
    super.initState();
    nameCredential();

    UserController().getUserDetails();
  }

  void nameCredential() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullname');
      emailFull = prefs.getString('email');
      mobileNo = prefs.getString('mobile');
      userToken = prefs.getString('userToken');

      authUser = prefs.getString("userToken");

      print(fullName);
      print(emailFull);
      print(mobileNo);
      print(userToken);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  buildBody(context) {
    if (authUser == null) {
      return Container(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Please log in to see the profile..",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 50,
            ),
            ReusablePrimaryButton(
                childText: 'Login Now',
                buttonColor: Colors.orange,
                textColor: Colors.white,
                onPressed: () {
                  push(context: context, widget: VerifyOtp());
                })
          ],
        ),
      ));
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                push(context: context, widget: ProfileEditPage());
              },
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width / 1.15,
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/images/user.png'),
                              )),
                          Column(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
                                'Hello',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              FutureBuilder<UserDetailsModel>(
                                  future: userController.userModelFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        snapshot.data!.user.name,
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      );
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  })
                            ],
                          ),
                          const Spacer(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(Icons.keyboard_arrow_right,
                                color: Colors.white, size: 30),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Additional Options',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            AdditionalOptionsListView(
              onpress: () {},
              icon: 'assets/icons/history.png',
              label: 'History',
            ),
            const SizedBox(
              height: 15,
            ),
            AdditionalOptionsListView(
              onpress: () {
                push(context: context, widget: TrackOrder());
              },
              icon: 'assets/icons/locaton.png',
              label: 'Track Order',
            ),
            const SizedBox(
              height: 80,
            ),
            ReusablePrimaryButton(
                childText: 'Sign Out',
                buttonColor: const Color(0xffEE0000),
                textColor: Colors.white,
                onPressed: () {
                  logoutUser();
                  // SharedPreferences pref =
                  //     await SharedPreferences.getInstance();
                  // pref.clear();
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(builder: (c) => const VerifyOtp()),
                  //     (route) => false);

                  // SharedServices.logOut(context);
                }),
          ]),
        ),
      );
    }
  }

  void logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var authToken = prefs.getString("userToken");
    prefs.remove("userToken");
    pushRemove(context: context, widget: VerifyOtp());
  }

  // Future getUserDetails() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     var userToken = prefs.getString('userToken');

  //     var url =
  //         "http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/details";
  //     var response = await http.post(Uri.parse(url), headers: {
  //       "Accept": "application/json",
  //       'Authorization': 'Bearer ' + userToken!,
  //     }, body: {
  //       "mobile_no": mobileNo,
  //     });

  //     if (response.statusCode == 200) {
  //       var jsonString = response.body;
  //       userData = json.decode(jsonString);
  //       print('////////////////////${response.body}');

  //       print('///////// Response Is: ${userData}');

  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       // String userToken = token;

  //       prefs.setBool('user', true);
  //       prefs.setString('userToken', userToken);
  //     } else {
  //       print('Data not found');
  //       print(userData);
  //       // Create a flutter toast.
  //       Fluttertoast.showToast(
  //           msg: "Data not found",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.BOTTOM,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.blue,
  //           textColor: Colors.white,
  //           fontSize: 20.0);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
