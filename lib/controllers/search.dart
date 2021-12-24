import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/controllers/search_controller.dart';
import 'package:sandeep_jwelery/models/search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final searchController = Get.put(SearchController());

class _HomeState extends State<Home> {
  TextEditingController controller = new TextEditingController();

  String currentValue = "";

  Future fetchString() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('controllerFor', controller.text);
  }

  @override
  void initState() {
    super.initState();
    // _search = data;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                color: Colors.blue,
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      onEditingComplete: () {
                        fetchString();
                      },
                      onChanged: (value) {
                        // print("searchValueLength" + value.length.toString());
                        setState(() {
                          if (value.isNotEmpty) {
                            var searchVal =
                                value.trim().toLowerCase().toString();

                            searchController.fetchData(searchVal);
                          } else if (value.isEmpty) {
                            searchController.fetchData('');
                          } else {
                            searchController.fetchData('');
                          }

                          // SharedPreferences prefs =
                          //     Get.find<SharedPreferences>();

                          // prefs.setString('searchVal', searchVal);
                        });
                      },
                      controller: searchController.controller,
                      decoration: InputDecoration(
                          hintText: "Search products..",
                          border: InputBorder.none),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        searchController.controller.clear();
                      },
                      icon: Icon(Icons.cancel),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    fetchString();

                    print('Seacrched: ${searchController.controller.text}');
                  },
                  child: Text('Search')),
              FutureBuilder<SearchModel>(
                  future: searchController.searcModelFuture,
                  builder: (context, snapshot) {
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            var img = searchController.data['data'][index]
                                ['feature_img'];

                            var useImage =
                                'http://ec2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/img/product/' +
                                    '${img}';

                            return InkWell(
                              onTap: () {
                                print('Clicked');
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Card(
                                      child: Row(
                                        children: [
                                          Image(
                                            image: NetworkImage(useImage),
                                            height: 120,
                                            width: 120,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  searchController.controller ==
                                                          ''
                                                      ? ''
                                                      : searchController
                                                          .data['data'][index]
                                                              ['productname']
                                                          .toString(),
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 25,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  searchController.controller ==
                                                          ''
                                                      ? ''
                                                      : searchController
                                                          .data['data'][index]
                                                              ['description']
                                                          .toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
