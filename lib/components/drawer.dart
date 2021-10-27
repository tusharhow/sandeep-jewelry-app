import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/additional_options_listview.dart';
import 'package:sandeep_jwelery/components/drawer_listview_buttorn.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Image(
            image: AssetImage('assets/logos/logo.png'),
            height: 50,
            width: 50,
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Orders',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DrawerListViewButton(label: 'Track Order'),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Spread the Word',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DrawerListViewButton(label: 'About Us'),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Policies',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DrawerListViewButton(label: 'Shipping'),
          SizedBox(
            height: 15,
          ),
          DrawerListViewButton(label: 'Exchange'),
          SizedBox(
            height: 15,
          ),
          DrawerListViewButton(label: 'Terms of Use'),
          SizedBox(
            height: 15,
          ),
          DrawerListViewButton(label: 'Privacy'),
          SizedBox(
            height: 15,
          ),
          DrawerListViewButton(label: 'FAQ'),
          SizedBox(
            height: 15,
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Contact Us',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          DrawerListViewButton(label: 'Call'),
          SizedBox(
            height: 15,
          ),
          DrawerListViewButton(label: 'Chat'),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
