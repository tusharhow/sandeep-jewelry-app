import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/components/textformfield.dart';
import 'package:sandeep_jwelery/screens/auth/signup.dart';

class VerifyOtp extends StatefulWidget {
  VerifyOtp({Key? key}) : super(key: key);

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
              child: Text(
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
              child: Text(
                'Enter Your Mobile Number to Continue',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xffD8D8D8),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Color(0xff272727),
                  hintText: 'Enter Mobile/Email',
                  hintStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
            const SizedBox(
              height: 30,
            ),
            ReusablePrimaryButton(
              childText: 'Verify',
              buttonColor: Colors.white,
              onPressed: () {},
              textColor: Colors.black,
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('New to this app? ',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                InkWell(
                  onTap: () {
                    push(context: context, widget: SignUp());
                  },
                  child: Text('Sign Up',
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
