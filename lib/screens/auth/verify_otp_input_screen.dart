import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/screens/homepage_main.dart';

import 'package:http/http.dart' as http;

class VerifyOtpInputScreen extends StatefulWidget {
  VerifyOtpInputScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);
  final String phoneNumber;

  @override
  _VerifyOtpInputScreenState createState() => _VerifyOtpInputScreenState();
}

// final TextEditingController _otpController = TextEditingController();

class _VerifyOtpInputScreenState extends State<VerifyOtpInputScreen> {
  bool hasError = false;
  String? currentText = "";
  Timer? _timer;
  int _start = 20;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Text(
              'Enter OTP sent to ${widget.phoneNumber == '' ? "000" : widget.phoneNumber}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              key: _formKey,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30),
                  child: PinCodeTextField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _otpController,
                    appContext: context,
                    pastedTextStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        color: Colors.white),
                    length: 4,
                    obscureText: false,

                    hintCharacter: "",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 100.0,
                      color: Colors.white,
                    ),
                    errorTextSpace: 25.0,
                    pinTheme: PinTheme(
                      fieldHeight: 60,
                      shape: PinCodeFieldShape.box,
                      fieldWidth: 55,
                      inactiveColor: Colors.white54,
                      activeFillColor: hasError ? Colors.red : Colors.amber,
                    ),
                    animationType: AnimationType.fade,
                    // controller: _otpController,
                    validator: (v) {
                      if (v!.length < 4) {
                        return "Please Fill all fields";
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    textStyle:
                        const TextStyle(fontSize: 23, color: Colors.white),
                    // errorAnimationController: errorController,

                    keyboardType: TextInputType.number,

                    onCompleted: (v) {
                      print("Completed");
                    },
                    // onTap: () {
                    //   print("Pressed");
                    // },

                    onChanged: (value) {
                      setState(() {
                        currentText = value;
                        print(currentText);
                      });
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            ReusablePrimaryButton(
                childText: 'Verify',
                buttonColor: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  //   AuthRepository().callLoginApi(
                  //     context,
                  //     widget.phoneNumber,
                  //   );
                  //   if (currentText == "1234") {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => HomePageMain(),
                  //       ),
                  //     );
                  //   } else {
                  //     print('Otp invalid');
                  //   }
                  // } else {
                  //   const ScaffoldMessenger(
                  //       child: Text('Something went wrong..'));
                  // }
                  otpValidation();
                }),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const Text(
                  'Didn’t Receive OTP? ',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    startTimer();
                  },
                  child: const Text(
                    'Resend',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
                alignment: Alignment.bottomLeft,
                child: Text("00:$_start",
                    style: const TextStyle(fontSize: 14, color: Colors.white)))
          ],
        ),
      ),
    );
  }

  Future otpValidation() async {
    var url = "${AppConfig.BASE_URL}/login";
    var response = await http.post(Uri.parse(url), body: {
      "mobile_no": widget.phoneNumber,
      "one_singnal": "y",
      "type": "client",
      "otp": currentText,
    });
    if (response.statusCode == 200) {
      print('OTP Validation successfully');
      // var loginArr = json.decode(response.body);

      print(response.statusCode);

      print(response.body);
      var datas = json.decode(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.setString('userToken', datas['success']['token']);
      var userTok = datas['success']['token'];
      print('////////////// Token is: ${userTok}');

      // print("mmmmmmmmmm" + loginArr.toString());

      // SharedPreferences pref = await SharedPreferences.getInstance();
      // pref.setString('mobile', widget.phoneNumber);

      // push(context: context, widget: HomePageMain());

      pushRemove(context: context, widget: HomePageMain());
    } else {
      print('OTP Validation failed');
      // Create a flutter toast.
      Fluttertoast.showToast(
          msg: "OTP Validation failed!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 20.0);
    }
  }
}
