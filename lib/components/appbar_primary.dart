import 'package:flutter/material.dart';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
AppBar secondaryAppbarWithOption() {
  return AppBar(
    elevation: 0,
          backgroundColor: Colors.black,
          
   leading: InkWell(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: const Image(
              image: AssetImage('assets/icons/menu.png'),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: const Image(
                image: AssetImage('assets/icons/search.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Image(
                image: AssetImage('assets/icons/heart.png'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image(
                  image: AssetImage('assets/icons/basket.png'),
                ),
              ),
            ),
          
    ],
  
  );
}