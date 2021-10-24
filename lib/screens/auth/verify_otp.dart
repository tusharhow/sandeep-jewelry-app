import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/screens/auth/signup.dart';
import 'package:sandeep_jwelery/screens/auth/verify_otp_input_screen.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({Key? key}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

TextEditingController _phoneController = TextEditingController();

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child:const Text(
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
              child:const Text(
                'Enter Your Mobile Number to Continue',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffD8D8D8),
                ),
              ),
            ),
        const    SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor:const Color(0xff272727),
                  hintText: 'Enter Mobile/Email',
                  hintStyle:const TextStyle(
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            ReusablePrimaryButton(
              childText: 'Verify',
              buttonColor: Colors.white,
              onPressed: () {
                push(context: context, widget:const VerifyOtpInputScreen());
              },
              textColor: Colors.black,
            ),
         const   SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
           const     Text('New to this app? ',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                InkWell(
                  onTap: () {
                    push(context: context, widget:const SignUp());
                  },
                  child:const Text('Sign Up',
                      style: TextStyle(color: Colors.blue, fontSize: 16)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
