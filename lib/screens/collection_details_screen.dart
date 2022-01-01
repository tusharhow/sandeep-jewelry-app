import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeep_jwelery/controllers/collection_details_controller.dart';
import 'package:sandeep_jwelery/models/collection_details_model.dart';

class CollectionDetailsScreen extends StatefulWidget {
   CollectionDetailsScreen({Key? key,required this.catId}) : super(key: key);
String catId;
  @override
  _CollectionDetailsScreenState createState() => _CollectionDetailsScreenState();
}
var collectionDetailsController = Get.put(CollectionDetailsController());

class _CollectionDetailsScreenState extends State<CollectionDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     collectionDetailsController.fetchData(widget.catId.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [

              FutureBuilder<CollectionDetailsModel>(
                  future: collectionDetailsController.collectionDetailsModel,
                  builder: (context, snapshot) {

                    switch(snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator(),);
                      default:
                        if (snapshot.hasData) {
                          return Container(child: Text(
                            snapshot.error.toString(),style: TextStyle(color: Colors.white),));
                        } else {
                          return SizedBox(
                            height: 800,
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  var datas = collectionDetailsController
                                      .data['data'][index];


                                  // var fuck = snapshot.data!.data[index];
                                  var img = collectionDetailsController
                                      .data['url'] + '/' + datas['image'];
                                  return InkWell(
                                    onTap: (){
                                      print(datas['category']);
                                    },
                                    child: Card(
                                      margin: EdgeInsets.only(top: 15),
                                      color: Colors.white10,
                                      child: Row(
                                        children: [
                                          Image(image: NetworkImage(img),
                                            height: 130,
                                            width: 130,),

                                          SizedBox(width: 20,),
                                          Column(
                                            children: [
                                              Text(
                                                datas['category'],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
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
