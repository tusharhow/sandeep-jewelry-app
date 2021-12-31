import 'package:carousel_pro/carousel_pro.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:sandeep_jwelery/components/about_this_product.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/mini_button.dart';
import 'package:sandeep_jwelery/components/similar_products_grid.dart';
import 'package:sandeep_jwelery/components/user_review.dart';
import 'package:sandeep_jwelery/controllers/add_cart_controller.dart';
import 'package:sandeep_jwelery/controllers/cart_cotroller.dart';
import 'package:sandeep_jwelery/controllers/product_details_controller.dart';
import 'package:sandeep_jwelery/models/product_details_model.dart';

final cartCotroller = Get.put(CartController());
final productDetailsCotroller = Get.put(ProductDetailsController());

// ignore: must_be_immutable
class ProductDetailView extends StatefulWidget {
  String prodId;
  String size;
  String items;
  String prodName;
  String color;
  String img;

  ProductDetailView({
    required this.prodId,
    required this.size,
    required this.items,
    required this.prodName,
    required this.img,
    required this.color,
  });

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final List<String> imgList = [
    "assets/images/jew2.png",
    "assets/images/jew3.png",
  ];

  final productDetailsController = Get.put(ProductDetailsController());
  final cartController = Get.put(CartController());

  int tag = 1;
  List<String> options = [
    '21',
    '25',
  ];
  bool isClicked = false;
  bool tapped = false;
  int groupValue = 0;

  Future<ProductDetailsModel>? productDetailsModelFuture;
  void initState() {
    super.initState();
    productDetailsController.getProdCall(widget.prodId.toString());
    cartController.addCart(
      widget.prodId,
      widget.size,
      widget.items,
      widget.prodName,
      widget.color,
      widget.img,
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});

    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: FutureBuilder<ProductDetailsModel>(
              future: productDetailsController.detailsModelFuture,
              builder: (context, snapshot) {
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator(),);
                  default:
                    if(snapshot.hasError){
                      return CircularProgressIndicator();
                    }else{
                      return Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                            productDetailsController.parsedData['data']
                            ['jwellery_name'],
                            style: TextStyle(color: Colors.white)),
                      );
                    }
                }
              }),
          backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height / 3.60,
              //   width: MediaQuery.of(context).size.width,
              //   child: Carousel(
              //     images: List.generate(imgList.length, (int index) {
              //       return Column(
              //         children: [
              //           Image(
              //             image: AssetImage(imgList[index]),
              //             height: 200,
              //             width: 200,
              //           ),
              //         ],
              //       );
              //     }),
              //     autoplay: true,
              //     dotSize: 6,
              //     dotPosition: DotPosition.bottomCenter,
              //     dotColor: Colors.green,
              //     dotIncreaseSize: 2,
              //     dotIncreasedColor: Colors.amber,
              //     indicatorBgPadding: 1,
              //     dotBgColor: Colors.black12.withOpacity(0),
              //     boxFit: BoxFit.contain,
              //   ),
              // ),
              FutureBuilder<ProductDetailsModel>(
                  future: productDetailsController.detailsModelFuture,
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                              height: 160,
                              width: MediaQuery.of(context).size.width,
                              child: Swiper(
                                  viewportFraction: 0.8,
                                  fade: 0.3,
                                  scale: 0.9,
                                  autoplay: true,
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    // var url = productDetailsController
                                    //         .parsedData['url'] +
                                    //     '/' +
                                    //     productDetailsController
                                    //             .parsedData['data']['files']
                                    //         [index]['image'];

                                    // var datas =
                                    //     snapshot.data!.data.files[index];
                                    // var img =
                                    //     '${snapshot.data!.url + '/' + datas.image}';

                                    var datas = productDetailsController
                                        .parsedData['data']['files'][index];

                                    var url2 = productDetailsController
                                            .parsedData['url'] +
                                        '/' +
                                        productDetailsController
                                                .parsedData['data']['files']
                                            [index]['image'];

                                    print(datas['image']);
                                    return Image(image: NetworkImage(url2));
                                  }));
                        }
                    }
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Image(
                    image: AssetImage('assets/icons/tag.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Flat 50% Off on this Product',
                      style: TextStyle(fontSize: 14, color: Colors.amber)),
                  const Spacer(),
                  IconButton(
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
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              FutureBuilder<ProductDetailsModel>(
                  future: productDetailsController.detailsModelFuture,
                  builder: (context, snapshot) {
                    return Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                          productDetailsController.parsedData['data']
                              ['jwellery_name'],
                          style: TextStyle(fontSize: 23, color: Colors.white)),
                    );
                    // By default, show a loading spinner
                  }),

              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  // Container(
                  //   alignment: Alignment.bottomLeft,
                  //   child: Text('₹ ${"widget.prodPrice"}',
                  //       style: TextStyle(fontSize: 25, color: Colors.white)),
                  // ),
                  FutureBuilder<ProductDetailsModel>(
                      future: productDetailsController.detailsModelFuture,
                      builder: (context, snapshot) {
                      switch(snapshot.connectionState){

                        case ConnectionState.none:
                        case ConnectionState.waiting:
                          return Center(child: CircularProgressIndicator(),);

                        default:
                          if(snapshot.hasData){
                            return Container(child: Text(
                              snapshot.hasError.toString(),style: TextStyle(color: Colors.white),));
                          }else{

                            return Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                  '₹ ${productDetailsController.parsedData['data']['amount']}',
                                  style:
                                  TextStyle(fontSize: 25, color: Colors.white)),
                            );
                          }
                      }
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  // const Text(
                  //   '₹${5455}',
                  //   style: TextStyle(
                  //     fontSize: 15,
                  //     color: Colors.white,
                  //     decoration: TextDecoration.lineThrough,
                  //   ),
                  // ),
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // InkWell(
              //   onTap: () {},
              //   child: Container(
              //     alignment: Alignment.bottomLeft,
              //     child: const Text(
              //       'Price Breakage',
              //       style: TextStyle(
              //         fontSize: 14,
              //         color: Colors.amber,
              //         decoration: TextDecoration.underline,
              //       ),
              //     ),
              //   ),
              // ),
              InkWell(
                onTap: () {},
                child: GFAccordion(
                  contentBackgroundColor: Colors.transparent,
                  collapsedTitleBackgroundColor: Colors.transparent,
                  title: 'Price Breakage',
                  textStyle: const TextStyle(
                    fontSize: 14,
                    color: Colors.amber,
                    decoration: TextDecoration.underline,
                  ),
                  expandedTitleBackgroundColor: Colors.transparent,
                  contentChild: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Gold',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '25%',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '₹${9550}',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Gold',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '25%',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '₹${9550}',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Gold',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '25%',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                            Text(
                              '₹${9550}',
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text('In Stock',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text('Select Quantity',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 45,
                    width: MediaQuery.of(context).size.width / 2.60,
                    decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<CartCotrollerIncreaments>(
                            init: CartCotrollerIncreaments(),
                            builder: (_) {
                              return TextButton(
                                  onPressed: () {
                                    _.decrements();
                                  },
                                  child: const Text(
                                    '-',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.amber),
                                  ));
                            }),
                        GetBuilder<CartCotrollerIncreaments>(
                            init: CartCotrollerIncreaments(),
                            builder: (_) {
                              return Text(
                                '${_.counter}',
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              );
                            }),
                        GetBuilder<CartCotrollerIncreaments>(
                            init: CartCotrollerIncreaments(),
                            builder: (_) {
                              return TextButton(
                                onPressed: () {
                                  _.increments();
                                },
                                child: const Text(
                                  '+',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.amber),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20 * 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MiniButton(
                    btnText: 'Add to Cart',
                    onPressed: () {},
                    btnTextColor: Colors.white,
                    // btnColor: const Color(0xff393939)
                    btnColor: Colors.amber,
                  ),
                  MiniButton(
                      btnText: 'Buy Now',
                      onPressed: () {},
                      btnTextColor: Colors.black,
                      btnColor: Colors.amber),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Select Weight (grams)',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              Row(
                children: [
                  // ChipsChoice<int>.single(
                  //   choiceStyle: const C2ChoiceStyle(color: Colors.white),
                  //   value: tag,
                  //   choiceActiveStyle: const C2ChoiceStyle(color: Colors.amber),
                  //   onChanged: (val) => setState(() => tag = val),
                  //   choiceItems: C2Choice.listFrom<int, String>(
                  //     source: options,
                  //     value: (i, v) => i,
                  //     label: (i, v) => v,
                  //   ),
                  // ),

                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          if (isClicked == false) {
                            {
                              isClicked = true;
                            }
                          } else {
                            isClicked = false;
                          }
                        },
                      );
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width / 4.20,
                      decoration: BoxDecoration(
                        color:
                            isClicked == true ? Colors.amber : Colors.white10,
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Certified By',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 15,
                  ),
                  Image(
                    image: AssetImage('assets/logos/logo2.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Delivery Options',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.black12,
                          hintText: 'Enter Pin Code',
                          hintStyle: TextStyle(color: Colors.white54)),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3.30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: const Center(
                      child: Text('Check'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'About the Product',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const AboutThisProduct(
                  label: 'Brand', labelDesc: 'Sandeep Jewellers'),
              const SizedBox(
                height: 15,
              ),
              const AboutThisProduct(label: 'hsn Code', labelDesc: 'skiwya'),
              const SizedBox(
                height: 15,
              ),
              const AboutThisProduct(
                  label: 'Features',
                  labelDesc:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis,am viverra orci sagittis eu volutpat odio'),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Row(
                  children: const [
                    Text(
                      'Ratings & Reviews',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '5.0 (834)',
                      style: TextStyle(color: Colors.white54, fontSize: 9),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const UserReview(),
              const SizedBox(
                height: 15,
              ),
              const UserReview(),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View all',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Similar Product',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SimilarProductGrid(),
                  SimilarProductGrid(),
                ],
              ),
              const SizedBox(
                height: 20 * 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
