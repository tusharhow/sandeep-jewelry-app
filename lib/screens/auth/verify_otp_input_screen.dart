import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import '../homepage_main.dart';

class VerifyOtpInputScreen extends StatefulWidget {
  const VerifyOtpInputScreen({Key? key}) : super(key: key);

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
            const Text(
              'Enter OTP sent to +91 9637175943',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Form(key: _formKey,
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30),
                  child: PinCodeTextField(
                   
                    
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    appContext: context,
                    pastedTextStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22.0,
                        color: Colors.white),
                    length: 5,
                    obscureText: false,

                    hintCharacter: "",
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 100.0,
                      color: Colors.white,
                    ),
                    errorTextSpace: 25.0,
                    pinTheme: PinTheme(
                      fieldHeight: 50,
                      fieldWidth: 40,
                      inactiveColor: Colors.red,
                      activeFillColor: hasError ? Colors.orange : Colors.amber,
                    ),
                    animationType: AnimationType.fade,
                    // controller: _otpController,
                    validator: (v) {
                      if (v!.length < 5) {
                        return "Please Fill all fields";
                      } else {
                        return null;
                      }
                    },
                    cursorColor: Colors.white,
                    animationDuration: const Duration(milliseconds: 300),
                    textStyle:
                        const TextStyle(fontSize: 16, color: Colors.white),
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
                  if (_formKey.currentState!.validate()) {
                    push(context: context, widget: const HomePageMain());
                  } else {
                    const ScaffoldMessenger(
                        child: Text('Something went wrong..'));
                  }
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
}
