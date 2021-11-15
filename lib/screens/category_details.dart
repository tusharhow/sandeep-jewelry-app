import 'package:flutter/material.dart';

class CategoryDetails extends StatefulWidget {
  CategoryDetails({Key? key, required this.imageProd, required this.title})
      : super(key: key);

  String title;
  String imageProd;

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(
            'Categories',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Center(
            child: Column(children: [
              Card(
                color: Colors.white10,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: InkWell(
                  onTap: () {
                    print('clicked list');
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width / 1.10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Image(
                                image: NetworkImage(widget.imageProd),
                              ),
                            ),
                            const SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 60,
                                ),
                                Text(
                                  widget.title,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        )));
  }
}
