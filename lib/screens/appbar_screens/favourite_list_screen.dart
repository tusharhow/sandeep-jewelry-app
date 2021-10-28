import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:like_button/like_button.dart';

class FavouriteProductListView extends StatefulWidget {
  const FavouriteProductListView({Key? key}) : super(key: key);

  @override
  _FavouriteProductListViewState createState() =>
      _FavouriteProductListViewState();
}

class _FavouriteProductListViewState extends State<FavouriteProductListView> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favourites',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              ListTile(
                leading: FlutterLogo(),
                title: Text(
                  'One-line with both widgets',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      tapped = !tapped;
                    });
                  },
                  icon: Icon(
                    Icons.favorite,
                    color: tapped ? Colors.red : Colors.grey,
                  ),
                  splashColor: Colors.redAccent,
                  iconSize: 30,
                
                ),
              ),
            ],
          )),

      // ListTile(
      //   selected: true,
      //   leading: FlutterLogo(),
      //   title: Text('One-line with both widgets',
      //       style: TextStyle(color: Colors.white)),
      //   trailing: FavoriteButton(
      //     iconSize: 70,
      //     iconColor: Colors.yellow,
      //     isFavorite: false,
      //     valueChanged: (_isFavorite) {
      //       print('Is Favorite : $_isFavorite ');
      //     },

      //   ),

      // ),
    );
  }
}
