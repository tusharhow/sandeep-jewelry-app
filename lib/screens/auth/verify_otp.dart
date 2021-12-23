import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/models/login_response.dart';
import 'package:sandeep_jwelery/screens/auth/signup.dart';
import 'package:sandeep_jwelery/screens/auth/verify_otp_input_screen.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/screens/navigation_screens/home_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

Future<LoginApiResponse>? _futureJwt;
String? currentText = "";
var loginArr;
TextEditingController _phoneController = TextEditingController();
bool isLoading = false;
GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  buildBody(BuildContext context) {
    if (_futureJwt == null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFDD700),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Enter Your Mobile Number to Continue',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffD8D8D8),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              validator: (input) => input!.length < 10
                  ? "Number Should be more than 10 Characters"
                  : null,
              key: globalFormKey,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: const Color(0xff272727),
                hintText: 'Enter Mobile Number',
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
              ),
              style: const TextStyle(
                color: Colors.white,
              ),
              onChanged: (value) {
                setState(() {
                  currentText = value;
                  print(currentText);
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ReusablePrimaryButton(
              childText: 'Verify',
              buttonColor: Colors.white,
              onPressed: () {
                // AuthRepository().apiCallOtp(context, _phoneController.text);
                // if (_futureJwt == null) {
                //   print('Enter valid number');
                // } else {
                //   push(
                //       context: context,
                //       widget: VerifyOtpInputScreen(
                //           phoneNumber: _phoneController.text));
                // }
                loginOtp();
              },
              textColor: Colors.black,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('New to this app? ',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                InkWell(
                  onTap: () {
                    push(context: context, widget: const SignUp());
                  },
                  child: const Text('Sign Up',
                      style: TextStyle(color: Colors.blue, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return FutureBuilder<LoginApiResponse>(
        //refer the object to the future
        future: _futureJwt,
        //
        builder: (context, snapshot) {
          //if the data is getting
          if (snapshot.hasData) {
            var token = snapshot.data!.token;
            print('Token Is: ${token}');
            return HomeNavigation();
          }
          //if the data results an error
          else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return CircularProgressIndicator();
        },
      );
    }
  }

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future loginOtp() async {
    var url =
        "http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/api/otp/request";
    var response = await http.post(Uri.parse(url), body: {
      "mobile_no": _phoneController.text,
    });

    // final data = json.decode(response.body);
    var jshonString = response.body;
    var loginArr = json.decode(jshonString);
    if (response.statusCode == 200) {
      print('OTP sent successfully');
      print("mmmmmmmmmm" + loginArr.toString());
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("mobile", _phoneController.text);
      // await FlutterKeychain.put(
      //     key: "pinkUserToken", value: loginArr['token'].toString());
      // await FlutterKeychain.put(
      //     key: "pinkUserName", value: loginArr['name'].toString());
      // await FlutterKeychain.put(
      //     key: "pinkUserUserID", value: loginArr['id'].toString());
      // await FlutterKeychain.put(
      //     key: "pinkUserEmail", value: loginArr['email'].toString());
      // await FlutterKeychain.put(
      //     key: "pinkUserPhone", value: loginArr['mobile_no'].toString());

      push(
          context: context,
          widget: VerifyOtpInputScreen(
            phoneNumber: _phoneController.text,
          ));

          
    } else {
      print('OTP sent failed');
      // Create a flutter toast.
      Fluttertoast.showToast(
          msg: "OTP sent failed!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }
}
