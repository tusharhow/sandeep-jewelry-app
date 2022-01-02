import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  var searchVal;
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
                            searchVal = value.trim().toLowerCase().toString();

                            searchController.fetchData(searchVal);
                          } else if (searchVal.isEmpty) {
                            print('Empty');
                          } else {
                            print('Else');
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
              // ElevatedButton(
              //     onPressed: () {
              //       searchController.fetchData(searchVal);
              //
              //       print('Seacrched: ${searchController.controller.text}');
              //     },
              //     child: Text('Search')),
              FutureBuilder<SearchModel>(
                  future: searchController.searcModelFuture,
                  builder: (context, snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator(),);
                      default:
                        if(snapshot.hasData){
                          return Container(child: Text(snapshot.hasError.toString()),);

                        }else{
                          return SizedBox(
                            height: 400,
                            child: ListView.builder(
                                itemCount: searchVal==null?0:2,
                                itemBuilder: (context, index) {
                                  var img = searchController.data['data'][index]
                                  ['feature_img'];

                                  var useImage =
                                      'http://erc2-18-216-225-19.us-east-2.compute.amazonaws.com/app/public/img/product/' +
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
                                                        searchController
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
                                                       searchController
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
                        }
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
