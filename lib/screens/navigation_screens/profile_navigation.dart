import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/additional_options_listview.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/screens/auth/verify_otp.dart';
import 'package:sandeep_jwelery/screens/profile_edit.dart';
import 'package:sandeep_jwelery/screens/track_order.dart';
import 'package:sandeep_jwelery/services/shared_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? _username;

class ProfileNavigation extends StatefulWidget {
  const ProfileNavigation({Key? key}) : super(key: key);

  @override
  State<ProfileNavigation> createState() => _ProfileNavigationState();
}

class _ProfileNavigationState extends State<ProfileNavigation> {
  @override
  void initState() {
    super.initState();
    name();
  }

  void name() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                              Text(
                                _username.toString(),
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
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
      ),
    );
  }

  void logoutUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    pushRemove(context: context, widget: VerifyOtp());
  }
}
