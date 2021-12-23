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
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            var searchVal = value.trim().toString();

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
                      // onEditingComplete: () {},
                      controller: searchController.controller,
                      decoration: InputDecoration(
                          hintText: "Search", border: InputBorder.none),
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
                    print('Clicked');
                    // print('Clicked: ${searchController.data}');
                    print('Seacrched: ${searchController.controller.text}');
                  },
                  child: Text('Search')),
              // Text(searchController.data[0]['category']),
              FutureBuilder<SearchModel>(
                  future: searchController.searcModelFuture,
                  builder: (context, snapshot) {
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            // var img = ['image'];
                            // data['data'][index]['category'].toString();
                            // var image =
                            //     '${data[index]['url]' + '/' + '${data[index]['image']}']}';

                            // var image = '${data['data'][index]['url']}' +
                            //     '/' +
                            //     '${data['data'][index]['image']}';

                            // print(image);
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Card(
                                    child: Row(
                                      children: [
                                        Text(
                                          searchController.controller == ''
                                              ? ''
                                              : searchController.data['data']
                                                      [index]['productname']
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 25,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          searchController.controller == ''
                                              ? ''
                                              : searchController.data['data']
                                                      [index]['website_view']
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 25,
                                          ),
                                        ),

                                        // Image.network(image),
                                      ],
                                    ),
                                  ),
                                ],
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
