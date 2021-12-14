import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/drawer_listview_buttorn.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/screens/sidebar_components_screen/about_us.dart';
import 'package:sandeep_jwelery/screens/sidebar_components_screen/exchange.dart';
import 'package:sandeep_jwelery/screens/sidebar_components_screen/faq.dart';
import 'package:sandeep_jwelery/screens/sidebar_components_screen/privacy.dart';
import 'package:sandeep_jwelery/screens/sidebar_components_screen/shipping.dart';
import 'package:sandeep_jwelery/screens/sidebar_components_screen/terms_of_use.dart';
import 'package:sandeep_jwelery/screens/track_order.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 30,
          ),
          const Image(
            image: AssetImage('assets/logos/logo.png'),
            height: 50,
            width: 50,
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Orders',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Track Order',
            onPressed: () {
              push(context: context, widget: TrackOrder());
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Spread the Word',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'About Us',
            onPressed: () {
              push(context: context, widget: const AboutUs());
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Policies',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Shipping',
            onPressed: () {
              push(context: context, widget: Shipping());
            },
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Exchange',
            onPressed: () {
              push(context: context, widget: Exchange());
            },
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Terms of Use',
            onPressed: () {
              push(context: context, widget: TermsOfUse());
            },
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Privacy',
            onPressed: () {
              push(context: context, widget: const PrivacyPage());
            },
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'FAQ',
            onPressed: () {
              push(context: context, widget: Faq());
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: const Text(
              'Contact Us',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Call',
            onPressed: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Chat',
            onPressed: () {},
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
