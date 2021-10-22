import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/screens/auth/signup.dart';
import 'package:sandeep_jwelery/screens/splash/splash_screen.dart';

import 'screens/auth/verify_otp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreenFirst(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Image(
                  image: AssetImage('assets/logos/logo.png'),
                  height: 200,
                  width: 200),
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Welcome!',
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Sign Up or Sign In to Continue',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            ReusablePrimaryButton(
                childText: 'Sign In',
                buttonColor: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                   push(context: context, widget: VerifyOtp());
                }),
            const SizedBox(
              height: 20,
            ),
            ReusablePrimaryButton(
                childText: 'Sign Up',
                buttonColor: Colors.white,
                textColor: Colors.black,
                onPressed: () {
                  push(context: context, widget: SignUp());
                })
          ],
        ),
      ),
    );
  }
}
