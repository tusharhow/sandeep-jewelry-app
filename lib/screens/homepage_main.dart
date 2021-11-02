import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/drawer.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/screens/appbar_screens/favourite_list_screen.dart';
import 'package:sandeep_jwelery/screens/auth/verify_otp.dart';
import 'package:sandeep_jwelery/screens/navigation_screens/collection_navigation.dart';
import 'package:sandeep_jwelery/screens/navigation_screens/home_navigation.dart';
import 'package:sandeep_jwelery/screens/navigation_screens/profile_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? username;
String? fullname;

class HomePageMain extends StatefulWidget {
  const HomePageMain({Key? key}) : super(key: key);

  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  int _selectedIndex = 0;

  final screens = [
    const HomeNavigation(),
    ShoppingPage(),
    const ProfileNavigation()
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          elevation: 0,
          child: AppDrawer(),
        ),
        key: _scaffoldKey,
        drawerEnableOpenDragGesture: false,
        // key: scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/home.png"),
                    color: Colors.amber,
                  ),
                  title: Text('Home', style: TextStyle(color: Colors.amber)),
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/grid.png"),
                  ),
                  title: Text('Collection'),
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: ImageIcon(
                    AssetImage("assets/icons/auth.png"),
                  ),
                  title: Text('Profile'),
                  backgroundColor: Colors.transparent),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber,
            iconSize: 40,
            onTap: (index) => setState(() {
                  _selectedIndex = index;
                }),
            elevation: 5),
        appBar: AppBar(
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
              onTap: () {
                push(
                    context: context, widget: const FavouriteProductListView());
              },
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
        ),
        body: screens[_selectedIndex]);
  }
}
