import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/additional_options_listview.dart';
import 'package:sandeep_jwelery/components/drawer_listview_buttorn.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/screens/sidebar_components_screen/about_us.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
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
            onPressed: () {},
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
              push(context: context, widget: AboutUs());
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
            onPressed: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Exchange',
            onPressed: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Terms of Use',
            onPressed: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'Privacy',
            onPressed: () {},
          ),
          const SizedBox(
            height: 15,
          ),
          DrawerListViewButton(
            label: 'FAQ',
            onPressed: () {},
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
