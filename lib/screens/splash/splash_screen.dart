import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/screens/homepage_main.dart';
import 'package:sandeep_jwelery/screens/splash/onboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      pushRemove(context: context, widget: const Intro2());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadedSlideAnimation(
          const Center(
            child: Image(
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

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var _token = prefs.getString('userToken');

    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      print(_seen);

      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>
              _seen == false ? SplashScreenFirst() : HomePageMain()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SplashScreenFirst()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return Material();
  }
}
