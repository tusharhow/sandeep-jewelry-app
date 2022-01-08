import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/controllers/search_controller.dart';
import 'package:sandeep_jwelery/models/search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// final searchController = Get.put(SearchController());

class _HomeState extends State<Home> {
  TextEditingController controller = new TextEditingController();

  // String currentValue = "";

  Future<SearchModel>? searcModelFuture;

  var searchData;
  var parsedValue;
  var sharedValue;
  var fuckData;

  names() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    sharedValue = prefs.getString('searchValue');
  }

  @override
  void initState() {
    super.initState();
    names();
    searcModelFuture = fetchData(fuckData);

    print('Khanki Magiiiiiiiiiiiiiiiiiiiii ${sharedValue}');
  }

  Future<SearchModel> fetchData(String val) async {
    try {
      final response = await http
          .post(Uri.parse("${AppConfig.BASE_URL}/filter_product"), body: {
        "search": val,
      }, headers: {
        "Accept": "application/json"
      });

      if (response.statusCode == 200) {
        setState(() {
          parsedValue = jsonDecode(response.body);

          searchData = SearchModel.fromJson(parsedValue);
        });

        print('Search OBJ: ${parsedValue['data']}');
      }
    } catch (e) {
      print(e);
    }
    return searchData;
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
                        // fetchString();
                      },
                      onChanged: (value) async {
                        // print("searchValueLength" + value.length.toString());
                        if (value.isNotEmpty) {
                          setState(() {
                            fuckData = value.trim().toLowerCase().toString();

                            fetchData(fuckData);
                            print('Fuckkkkkkkkkkkkkkkk: ${fuckData}');
                          });
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          prefs.setString('searchValue', fuckData);
                        } else {
                          print('Else');
                        }
                      },
                      controller: controller,
                      decoration: InputDecoration(
                          hintText: "Search products..",
                          border: InputBorder.none),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        controller.clear();
                      },
                      icon: Icon(Icons.cancel),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder<SearchModel>(
                  future: searcModelFuture,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Card(
                                  color: Colors.white10,
                                  child: Text(
                                    snapshot.data!.data[index].productname
                                        .toString(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
