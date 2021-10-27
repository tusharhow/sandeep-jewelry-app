import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/additional_options_listview.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';

class ProfileNavigation extends StatelessWidget {
  const ProfileNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            InkWell(
              onTap: () {},
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
                            children: const [
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                'Hello',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.white54, fontSize: 16),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Anil Jain',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
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
              height: 20,
            ),
            const AdditionalOptionsListView(
              icon: 'assets/icons/pass.png',
              label: 'Change Password',
            ),
            const SizedBox(
              height: 15,
            ),
            const AdditionalOptionsListView(
              icon: 'assets/icons/history.png',
              label: 'History',
            ),
            const SizedBox(
              height: 15,
            ),
            const AdditionalOptionsListView(
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
                onPressed: () {}),
          ]),
        ),
      ),
    );
  }
}
