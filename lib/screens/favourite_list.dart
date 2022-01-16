import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/models/wishlist_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config.dart';

class FavouriteProductListView extends StatefulWidget {
  FavouriteProductListView({Key? key}) : super(key: key);

  @override
  _FavouriteProductListViewState createState() =>
      _FavouriteProductListViewState();
}

Future<WishListModel>? wishModelFuture;
var wishData;

class _FavouriteProductListViewState extends State<FavouriteProductListView> {
  @override
  void initState() {
    super.initState();
    setState(() {
      wishModelFuture = getWishList();
    });
  }

  Future<WishListModel> getWishList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('userToken');

    try {
      var url = '${AppConfig.BASE_URL}/wishlist';

      final response = await http.get(
        Uri.parse(url),
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          var wished = json.decode(response.body);
          wishData = WishListModel.fromJson(wished);
        });
      }
    } catch (e) {
      print(e);
    }
    return wishData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Wishlist',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            FutureBuilder<WishListModel>(
                future: wishModelFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Expanded(
                        child: ListView.builder(
                            itemCount: snapshot.data!.data.length,
                            itemBuilder: (context, index) {
                              var datasss = snapshot.data!.data[index];
                              var url =
                                  'https://admin.sandeepjewellers.com/app/public/img/product/';
                              var img = url + datasss.image;
                              return Card(
                                color: Colors.white12,
                                child: Row(
                                  children: [
                                    Image(
                                      image: NetworkImage(img),
                                      height: 90,
                                      width: 90,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        datasss.productname,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }));
                  }
                })
          ],
        ),
      ),
    );
  }
}
