import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/models/search_model.dart';
import 'package:sandeep_jwelery/screens/product_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../config.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController controller = new TextEditingController();

  Future<SearchModel>? searcModelFuture;

  var searchData;
  var parsedValue;
  var sharedValue;
  String SeatchModelData = '';

  names() async {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      names();
      searcModelFuture = fetchData(SeatchModelData);
    });
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

        // print('Search OBJ: ${parsedValue['data']}');
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
                padding: EdgeInsets.all(15.0),
                color: Colors.green,
                child: Card(
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: TextField(
                      onEditingComplete: () {
                        setState(() {
                          SeatchModelData = controller.text;
                          searcModelFuture = fetchData(SeatchModelData);
                        });
                      },
                      onChanged: (value) async {
                        // print("searchValueLength" + value.length.toString());
                        if (value.isNotEmpty) {
                          setState(() {
                            SeatchModelData =
                                value.trim().toLowerCase().toString();
                            searcModelFuture = fetchData(SeatchModelData);
                          });

                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          prefs.setString('searchValue', SeatchModelData);
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
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              var datas = snapshot.data!.data[index];
                              var url =
                                  'https://admin.sandeepjewellers.com/app/public/img/product/';
                              return InkWell(
                                onTap: () {
                                  push(
                                      context: context,
                                      widget: ProductDetailView(
                                          prodId: datas.productId.toString(),
                                          size: datas.sizeType,
                                          items: datas.amount,
                                          prodName: datas.productname,
                                          img: datas.amount,
                                          prodPrice: datas.amount,
                                          color:
                                              datas.jewelleryColor.toString()));
                                },
                                child: Card(
                                  color: Colors.white10,
                                  child: Row(
                                    children: [
                                      Image(
                                        image: NetworkImage(url +
                                            snapshot
                                                .data!.data[index].featureImg),
                                        height: 80,
                                        width: 80,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot
                                                .data!.data[index].productname
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            snapshot
                                                .data!.data[index].description
                                                .toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                            textAlign: TextAlign.justify,
                                            maxLines: 1,
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15),
                                        child: Text(
                                          '₹ ${snapshot.data!.data[index].amount}'
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
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
