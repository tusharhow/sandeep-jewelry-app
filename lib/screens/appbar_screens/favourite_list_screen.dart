import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/screens/track_order.dart';

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
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
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
                leading: const FlutterLogo(),
                title: const Text(
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
              Center(
                child: ReusablePrimaryButton(
                    childText: 'Proceed',
                    buttonColor: const Color(0xffFFD809),
                    textColor: Colors.black,
                    onPressed: () {
                      push(context: context, widget: TrackOrder());
                    }),
              )
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
