import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/drawer.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/models/show_cart_model.dart';
import 'package:sandeep_jwelery/screens/appbar_screens/search.dart';
import 'package:sandeep_jwelery/screens/appbar_screens/cart.dart';
import 'package:sandeep_jwelery/screens/navigation_screens/collection_navigation.dart';
import 'package:sandeep_jwelery/screens/navigation_screens/home_navigation.dart';
import 'package:sandeep_jwelery/screens/navigation_screens/profile_navigation.dart';
import 'package:sandeep_jwelery/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';

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
  void initState() {
    super.initState();
    setState(() {
      allDataModelFuture = getAllCart();
      getAllCart();
    });
  }

  Future<ShowCartModel>? allDataModelFuture;

  Future<ShowCartModel> getAllCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = prefs.getString('userToken');

    try {
      var url = '${AppConfig.BASE_URL}/cartlist';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          var jsonString = response.body;
          allParsedData = json.decode(jsonString);

          cartData = ShowCartModel.fromJson(allParsedData);
        });
      }
    } catch (e) {
      print(e);
    }
    return cartData;
  }

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
            // SizedBox(
            //     height: 40,
            //     width: MediaQuery.of(context).size.width - 210,
            //     child: SearchFunction()),
            IconButton(
                onPressed: () {
                  push(context: context, widget: SearchPage());
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                )),
            // InkWell(
            //   onTap: () {
            //     push(
            //         context: context, widget: const FavouriteProductListView());
            //   },
            //   child: const Image(
            //     image: AssetImage('assets/icons/heart.png'),
            //   ),
            // ),

            // FutureBuildler
            FutureBuilder<ShowCartModel>(
                future: allDataModelFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          push(context: context, widget: const NoCartItem());
                        });
                      },
                      child: Image(
                        image: AssetImage('assets/icons/basket.png'),
                      ),
                    );
                  } else {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const CartPage()));
                        });
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Column(
                            children: [
                              Text(
                                '${snapshot.data!.data.length}',
                                style:
                                    TextStyle(color: Colors.red, fontSize: 12),
                              ),
                              Image(
                                image: AssetImage('assets/icons/basket.png'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                })
          ],
        ),
        body: screens[_selectedIndex]);
  }
}
