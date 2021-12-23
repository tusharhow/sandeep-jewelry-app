import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/config.dart';
import 'package:sandeep_jwelery/models/search_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

// class SearchFunction extends StatefulWidget {
//   @override
//   _SearchFunctionState createState() => _SearchFunctionState();
// }

// int toggle = 0;

// class _SearchFunctionState extends State<SearchFunction>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _con;
//   late TextEditingController _textEditingController;
//   @override
//   void initState() {
//     super.initState();
//     _textEditingController = TextEditingController();
//     _con = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 375),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         height: 90.0,
//         width: 250.0,
//         alignment: const Alignment(1.0, 0.0),
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 375),
//           height: 40.0,
//           width: (toggle == 0) ? 40.0 : 250.0,
//           curve: Curves.easeOut,
//           decoration: BoxDecoration(
//             color: Colors.white54,
//             borderRadius: BorderRadius.circular(30.0),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black26,
//                 spreadRadius: -10.0,
//                 blurRadius: 10.0,
//                 offset: Offset(0.0, 10.0),
//               ),
//             ],
//           ),
//           child: Stack(
//             children: [
//               AnimatedPositioned(
//                 duration: const Duration(milliseconds: 375),
//                 top: 6.0,
//                 right: 7.0,
//                 curve: Curves.easeOut,
//                 child: AnimatedOpacity(
//                   opacity: (toggle == 0) ? 0.0 : 1.0,
//                   duration: const Duration(milliseconds: 200),
//                   child: Container(
//                     padding: const EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       // color: Color(0xffF2F3F7),
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                     child: AnimatedBuilder(
//                       builder: (context, widget) {
//                         return Transform.rotate(
//                           angle: _con.value * 2.0 * pi,
//                           child: widget,
//                         );
//                       },
//                       animation: _con,
//                     ),
//                   ),
//                 ),
//               ),
//               AnimatedPositioned(
//                 duration: const Duration(milliseconds: 375),
//                 left: (toggle == 0) ? 20.0 : 40.0,
//                 curve: Curves.easeOut,
//                 top: 11.0,
//                 child: AnimatedOpacity(
//                   opacity: (toggle == 0) ? 0.0 : 1.0,
//                   duration: const Duration(milliseconds: 200),
//                   child: SizedBox(
//                     height: 35.0,
//                     width: 180.0,
//                     child: TextField(
//                       style: const TextStyle(color: Colors.black),
//                       controller: _textEditingController,
//                       cursorRadius: const Radius.circular(10.0),
//                       cursorColor: Colors.black,
//                       decoration: InputDecoration(
//                         hintText: 'Search...',
//                         hintStyle: const TextStyle(
//                           color: Colors.black87,
//                         ),
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(20.0),
//                           borderSide: BorderSide.none,
//                         ),
//                       ),
//                       // onSubmitted: ()=> showSearch(context: context, delegate: Search()),
//                     ),
//                   ),
//                 ),
//               ),
//               Material(
//                 color: Colors.white54,
//                 borderRadius: BorderRadius.circular(30.0),
//                 child: IconButton(
//                   splashRadius: 19.0,
//                   icon: const Icon(Icons.search, color: Colors.black),
//                   onPressed: () {
//                     setState(
//                       () {
//                         if (toggle == 0) {
//                           toggle = 1;
//                           // _con.forward();
//                         } else {
//                           toggle = 0;
//                           _textEditingController.clear();
//                           _con.reverse();
//                         }
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class Search extends SearchDelegate {
  List<String> data = [
    "Ring",
    "Neckalce",
    "Diamond",
    "Gold",
    "parrotOS",
    "mint"
  ];

  Future<SearchModel>? _search;
  var datas;
  Future fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var cont = prefs.getString('controllerFor');
    final response = await http
        .post(Uri.parse("${AppConfig.BASE_URL}/filter_product"), body: {
      "search": cont,
    }, headers: {
      "Accept": "application/json"
    });
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      print('Search Data${datas}');
    }
    return datas;
    
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (datas.contains(query.toLowerCase())) {
      return ListTile(
        title: Text(
          query,
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {},
      );
    } else if (query == "") {
      return Text("");
    } else {
      return ListTile(
        title: Text(
          "No results found",
          style: TextStyle(color: Colors.white),
        ),
        onTap: () {},
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Text('');
        });
  }
}
