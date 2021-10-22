import 'dart:async';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/screens/splash/onboard.dart';

class SplashScreenFirst extends StatefulWidget {
  const SplashScreenFirst({Key? key}) : super(key: key);

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreenFirst> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      pushRemove(context: context, widget:const Intro2());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadedSlideAnimation(
       const   Center(
            child:  Image(
              image: AssetImage('assets/logos/logo.png'),
              height: 200,
              width: 200,
            ),
          ),
          beginOffset: const Offset(0.0, 5.0),
          endOffset: const Offset(0.0, 0.0),
        ),
      ],
    ));
  }
}
