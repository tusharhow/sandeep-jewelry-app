import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrackTryAtHome extends StatefulWidget {
  var orderData;
  TrackTryAtHome(this.orderData);
  @override
  _TrackTryAtHomeState createState() => _TrackTryAtHomeState();
}

class _TrackTryAtHomeState extends State<TrackTryAtHome> {
  @override
  Widget build(BuildContext context) {
    print(widget.orderData);
    print(widget.orderData['product_name']);
    print(widget.orderData['shipping_address']['city']);
print(  widget.orderData['status_code']);
    return Scaffold(
      //  backgroundColor: ColorUse().appThemeColor,
      appBar: AppBar(
        title: Text("Track Try At Home Order",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 22,
                fontWeight: FontWeight.w400,
              ),
            )),
        // backgroundColor:ColorUse().appThemeColor,
        //elevation: 0.4,
        iconTheme: IconThemeData(color: Colors.grey[700]),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 4,
              width: MediaQuery.of(context).size.width,
              //color: ColorUse().white,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text("Order Status ",
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 18,
                                fontWeight: FontWeight.w400,
                                color: ColorUse().appColor),
                          )),
                      const Spacer(),
                      // Container(
                      //   height: MediaQuery.of(context).size.width / 5,
                      //   width: MediaQuery.of(context).size.width / 5,
                      //   decoration: BoxDecoration(
                      //     color: Colors.amber,
                      //     // image: DecorationImage(
                      //     //   image: NetworkImage(Api().picUrl+widget.orderData['product_image']),fit: BoxFit.fill
                      //     // )
                      //   ),
                      // )
                    ],
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 50,
            ),
            widget.orderData['status_code'] == 1.toString()
                ? SizedBox(
                    // height: MediaQuery.of(context).size.width/2,
                    width: MediaQuery.of(context).size.width,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.check_box,
                                color: ColorUse().appColor,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 62,
                              ),
                              Text("Order Under Process",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.width / 8,
                              width: MediaQuery.of(context).size.width / 100,
                              color: ColorUse().appColor,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_box,
                                color: Colors.grey[400],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 62,
                              ),
                              Text("Shipped",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.width / 8,
                              width: MediaQuery.of(context).size.width / 100,
                              color: ColorUse().appThemeColor,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_box,
                                color: Colors.grey[400],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 62,
                              ),
                              Text("Out for delivery",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.width / 8,
                              width: MediaQuery.of(context).size.width / 100,
                              color: ColorUse().appThemeColor,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.check_box,
                                color: Colors.grey[400],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 62,
                              ),
                              Text("Arriving On",
                                  style: GoogleFonts.lato(
                                    textStyle: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              20,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : widget.orderData['status_code'] == 2.toString()
                    ? SizedBox(
                        // height: MediaQuery.of(context).size.width/2,
                        width: MediaQuery.of(context).size.width,

                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_box,
                                    color: ColorUse().appColor,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        62,
                                  ),
                                  Text("Order Placed",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 8,
                                  width:
                                      MediaQuery.of(context).size.width / 100,
                                  color: ColorUse().appColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_box,
                                    color: ColorUse().appColor,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        62,
                                  ),
                                  Text("Shipped",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 8,
                                  width:
                                      MediaQuery.of(context).size.width / 100,
                                  color: ColorUse().appColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.grey[400],
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        62,
                                  ),
                                  Text("Out for delivery",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width / 8,
                                  width:
                                      MediaQuery.of(context).size.width / 100,
                                  color: ColorUse().appThemeColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check_box,
                                    color: Colors.grey[400],
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width /
                                        62,
                                  ),
                                  Text("Arriving 27th May",
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : widget.orderData['status_code'] == 3.toString()
                        ? SizedBox(
                            // height: MediaQuery.of(context).size.width/2,
                            width: MediaQuery.of(context).size.width,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_box,
                                        color: ColorUse().appColor,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width /
                                            62,
                                      ),
                                      Text("Order Placed",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              8,
                                      width:
                                          MediaQuery.of(context).size.width /
                                              100,
                                      color: ColorUse().appColor,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_box,
                                        color: ColorUse().appColor,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width /
                                            62,
                                      ),
                                      Text("Shipped",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              8,
                                      width:
                                          MediaQuery.of(context).size.width /
                                              100,
                                      color: ColorUse().appColor,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_box,
                                        color: ColorUse().appColor,
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width /
                                            62,
                                      ),
                                      Text("Out for delivery",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width /
                                              8,
                                      width:
                                          MediaQuery.of(context).size.width /
                                              100,
                                      color: ColorUse().appColor,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_box,
                                        color: Colors.grey[400],
                                      ),
                                      SizedBox(
                                        width: MediaQuery.of(context)
                                                .size
                                                .width /
                                            62,
                                      ),
                                      Text("Arriving 27th May",
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : widget.orderData['status_code'] == 4.toString()
                            ? SizedBox(
                                // height: MediaQuery.of(context).size.width/2,
                                width: MediaQuery.of(context).size.width,

                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: ColorUse().appColor,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                62,
                                          ),
                                          Text("Order Placed",
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          20,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              8,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              100,
                                          color: ColorUse().appColor,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: ColorUse().appColor,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                62,
                                          ),
                                          Text("Shipped",
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          20,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              8,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              100,
                                          color: ColorUse().appColor,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: ColorUse().appColor,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                62,
                                          ),
                                          Text("Out for delivery",
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          20,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              8,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              100,
                                          color: ColorUse().appColor,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.check_box,
                                            color: ColorUse().appColor,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                62,
                                          ),
                                          Text("Delivered",
                                              style: GoogleFonts.lato(
                                                textStyle: TextStyle(
                                                  fontSize:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          20,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : widget.orderData['status_code'] == 5.toString()
                                ? SizedBox(
                                    // height: MediaQuery.of(context).size.width/2,
                                    width: MediaQuery.of(context).size.width,

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_box,
                                                color: ColorUse().appColor,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    62,
                                              ),
                                              Text("Order Placed",
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100,
                                              color: ColorUse().appColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_box,
                                                color: ColorUse().appColor,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    62,
                                              ),
                                              Text("Shipped",
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100,
                                              color: ColorUse().appColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_box,
                                                color: ColorUse().appColor,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    62,
                                              ),
                                              Text("Out for delivery",
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100,
                                              color: ColorUse().appColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_box,
                                                color: ColorUse().appColor,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    62,
                                              ),
                                              Text("Delivered",
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100,
                                              color: ColorUse().appColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_box,
                                                color: ColorUse().appColor,
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    62,
                                              ),
                                              Text("Return Under Process",
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100,
                                              color: ColorUse().appColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_box,
                                                color: Colors.grey[400],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    62,
                                              ),
                                              Text("Out for pickup",
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.all(8.0),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  8,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  100,
                                              color: ColorUse().appThemeColor,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.check_box,
                                                color: Colors.grey[400],
                                              ),
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    62,
                                              ),
                                              Text("Returned",
                                                  style: GoogleFonts.lato(
                                                    textStyle: TextStyle(
                                                      fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          20,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : widget.orderData['status_code'] ==
                                        6.toString()
                                    ? SizedBox(
                                        // height: MediaQuery.of(context).size.width/2,
                                        width:
                                            MediaQuery.of(context).size.width,

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_box,
                                                    color:
                                                        ColorUse().appColor,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            62,
                                                  ),
                                                  Text("Order Placed",
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          8,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          100,
                                                  color: ColorUse().appColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_box,
                                                    color:
                                                        ColorUse().appColor,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            62,
                                                  ),
                                                  Text("Shipped",
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          8,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          100,
                                                  color: ColorUse().appColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_box,
                                                    color:
                                                        ColorUse().appColor,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            62,
                                                  ),
                                                  Text("Out for delivery",
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          8,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          100,
                                                  color: ColorUse().appColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_box,
                                                    color:
                                                        ColorUse().appColor,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            62,
                                                  ),
                                                  Text("Delivered",
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          8,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          100,
                                                  color: ColorUse().appColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_box,
                                                    color:
                                                        ColorUse().appColor,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            62,
                                                  ),
                                                  Text("Return Under Process",
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          8,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          100,
                                                  color: ColorUse().appColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_box,
                                                    color:
                                                        ColorUse().appColor,
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            62,
                                                  ),
                                                  Text("Out for pickup",
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  height:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          8,
                                                  width:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          100,
                                                  color: ColorUse().appColor,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.check_box,
                                                    color: Colors.grey[400],
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            62,
                                                  ),
                                                  Text("Returned",
                                                      style: GoogleFonts.lato(
                                                        textStyle: TextStyle(
                                                          fontSize: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width /
                                                              20,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : widget.orderData['status_code'] ==
                                            7.toString()
                                        ? SizedBox(
                                            // height: MediaQuery.of(context).size.width/2,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,

                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text("Order Placed",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          8,
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          100,
                                                      color:
                                                          ColorUse().appColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text("Shipped",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          8,
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          100,
                                                      color:
                                                          ColorUse().appColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text("Out for delivery",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          8,
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          100,
                                                      color:
                                                          ColorUse().appColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text("Delivered",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          8,
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          100,
                                                      color:
                                                          ColorUse().appColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text(
                                                          "Return Under Process",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          8,
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          100,
                                                      color:
                                                          ColorUse().appColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text("Out for pickup",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          8,
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          100,
                                                      color:
                                                          ColorUse().appColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text("Returned",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : SizedBox(
                                            // height: MediaQuery.of(context).size.width/2,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,

                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text("Order Placed",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          8,
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          100,
                                                      color:
                                                          ColorUse().appColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text("Shipped",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Container(
                                                      height: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          8,
                                                      width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width /
                                                          100,
                                                      color:
                                                          ColorUse().appColor,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons.check_box,
                                                        color: ColorUse()
                                                            .appColor,
                                                      ),
                                                      SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            62,
                                                      ),
                                                      Text("Cancelled",
                                                          style: GoogleFonts
                                                              .lato(
                                                            textStyle:
                                                                TextStyle(
                                                              fontSize: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width /
                                                                  20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                          )),
                                                    ],
                                                  ),
                                                
                                                ],
                                              ),
                                            ),
                                          ),
            Container(
              height: MediaQuery.of(context).size.width / 50,
              width: MediaQuery.of(context).size.width,
              color: ColorUse().appThemeColor,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 50,
            ),
            widget.orderData['review'] != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height:
                                    MediaQuery.of(context).size.height *
                                        .02,
                                width: MediaQuery.of(context).size.width *
                                    .08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.tealAccent[700],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.orderData['review']['review']
                                          .toString(),
                                      style: GoogleFonts.lato(
                                        textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width / 32,
                            ),
                            SizedBox(
                              width:
                                  MediaQuery.of(context).size.width / 2,
                              child: Text(
                                widget.orderData['review']
                                        ['review_details']
                                    .toString(),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
//                                 Route route = MaterialPageRoute(builder: (context) => Review(widget.orderData));
// Navigator.pushReplacement(context, route);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Edit",
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              26,
                                          fontWeight: FontWeight.w400,
                                          color: ColorUse().appColor),
                                    )),
                              ),
                            )
                         
                          ],
                        ),
                      ],
                    ))
                :Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("How's your item?",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.width / 24,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 42,
                      ),
                      InkWell(
                        onTap: () {
//                        Route route = MaterialPageRoute(builder: (context) => Review(widget.orderData));
// Navigator.pushReplacement(context, route);
                          //                   Navigator.push(
                          //         context,
                          // MaterialPageRoute(builder: (context) => Review(widget.orderData)),
                          //             );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: MediaQuery.of(context).size.width /
                                    400,
                                color: ColorUse()
                                    .fontColor
                                    .withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Write a product review",
                                    textAlign: TextAlign.start,
                                    style: GoogleFonts.lato(
                                      textStyle: TextStyle(
                                        fontSize: MediaQuery.of(context)
                                                .size
                                                .width /
                                            20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width /
                                        42,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ]),
                  ),

            SizedBox(
              height: MediaQuery.of(context).size.width / 50,
            ),

            SizedBox(
              // height: MediaQuery.of(context).size.width/3,
              width: MediaQuery.of(context).size.width,

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 50,
                      width: MediaQuery.of(context).size.width,
                      color: ColorUse().appThemeColor,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 42,
                    ),

                    Container(
                      height: MediaQuery.of(context).size.width / 50,
                      width: MediaQuery.of(context).size.width,
                      color: ColorUse().appThemeColor,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 42,
                    ),
                    widget.orderData['status_code'] == 1.toString() ||
                            widget.orderData['status_code'] == 2.toString()
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text("Need help with Your Item",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize: MediaQuery.of(context)
                                            .size
                                            .width /
                                        24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.width / 42,
                            ),
                            InkWell(
                              onTap: () {
                                //                 Navigator.push(
                                //       context,
                                // MaterialPageRoute(builder: (context) => CancelOrder(widget.orderData)),
                                //           );
                                //      },
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      width: MediaQuery.of(context)
                                              .size
                                              .width /
                                          400,
                                      color: ColorUse()
                                          .fontColor
                                          .withOpacity(0.4)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Cancel Items",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.lato(
                                            textStyle: TextStyle(
                                              fontSize:
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )),
                                    ),
                                    SizedBox(
                                      height: MediaQuery.of(context)
                                              .size
                                              .width /
                                          42,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ])
                        : const SizedBox(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 32,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.width / 50,
                      width: MediaQuery.of(context).size.width,
                      color: ColorUse().appThemeColor,
                    ),

                    SizedBox(
                      height: MediaQuery.of(context).size.width / 32,
                    ),
                    Text("Shipping Address",
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 20,
                            fontWeight: FontWeight.w400,
                          ),
                        )),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: MediaQuery.of(context).size.width / 400,
                              color: ColorUse().fontColor.withOpacity(0.4)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 42,
                            ),
                            Text(widget.orderData['shipping_address']['name'],
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            26,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 82,
                            ),
                            Text(
                                widget.orderData['shipping_address']['flat']
                                        .toString() +
                                    " , " +
                                    widget.orderData['shipping_address']
                                            ['location']
                                        .toString(),
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            26,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 82,
                            ),
                            Text(
                                widget.orderData['shipping_address']['city']
                                        .toString() +
                                    " , " +
                                    widget.orderData['shipping_address']
                                            ['district']
                                        .toString(),
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            26,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 82,
                            ),
                            Text(
                                widget.orderData['shipping_address']['state']
                                        .toString() +
                                    " , " +
                                    widget.orderData['shipping_address']
                                            ['pincode']
                                        .toString(),
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width /
                                            26,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 50,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.width / 50,
            ),
          ],
        ),
      ),
    );
  }
}

class ColorUse {
  //final color = Color(0xff120E43);
  //0xFF3944F7
  Color appColor = Color(0xFFf398c2);
  Color fontColor = Colors.black;
  Color appThemeColor = Colors.grey;
  Color white = Colors.white;
  // Color appColorgredient2 =  Colors.tealAccent[400];

}
