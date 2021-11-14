import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandeep_jwelery/components/list_tile_card.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/shop_carousel.dart';
import 'package:sandeep_jwelery/components/todays_deals_card.dart';
import 'package:sandeep_jwelery/controllers/product_controller.dart';
import 'package:sandeep_jwelery/models/cm.dart';
import 'package:sandeep_jwelery/screens/category_details.dart';
import 'package:sandeep_jwelery/screens/product_details.dart';

final productController = Get.put(ProductController());

class HomeNavigation extends StatelessWidget {
  const HomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: const Image(
                    image: AssetImage('assets/images/caro2.png'),
                    color: Colors.black38,
                    colorBlendMode: BlendMode.hardLight,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  left: 10,
                  top: 50,
                  child: Text(
                    'Your Favourite Designs\n Now at your Doorstep',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Positioned(
                    left: 110,
                    top: 120,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                          height: 45,
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text('Browse Now'),
                          )),
                    )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Shop for',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<ProductModel>(
                future: productController.dataModelFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.products.length,
                        itemBuilder: (context, index) {
                          var datas = snapshot.data!.products[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (c) => CategoryDetails(
                                    imageProd: datas.image,
                                    title: datas.title,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 0,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.black,
                              child: Row(
                                children: [
                                  ShopCarousel(
                                    image: 'assets/images/human.png',
                                    label: datas.category,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            const SizedBox(
              height: 25,
            ),
            Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Today’s Deals',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<ProductModel>(
                future: productController.dataModelFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 230,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data!.products.length,
                          itemBuilder: (context, index) {
                            var datas = snapshot.data!.products[index];

                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (c) => ProductDetailView(
                                      prodName: datas.title,
                                      prodCategory: datas.category,
                                      prodDescription: datas.description,
                                      prodId: datas.id,
                                      prodImage: datas.image,
                                      prodPrice: datas.price.toString(),
                                      prodRating: datas.rating,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 0,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                color: Colors.black,
                                child: Row(
                                  children: [
                                    TodaysDealsCard(
                                      label: datas.title,
                                      labelImage: datas.image,
                                      productDesc: '34 gm , 24kt Gold',
                                      rating: datas.rating.rate.toDouble(),
                                      ratingLevel: datas.rating.rate.toString(),
                                      ratingCount:
                                          datas.rating.count.toString(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    print('err');
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'House of Collection',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                FutureBuilder<ProductModel>(
                    future: productController.dataModelFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            primary: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              var datas = snapshot.data!.products[index];
                              return InkWell(
                                  onTap: () => print("click"),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white12,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.network(datas.image,
                                                  fit: BoxFit.contain),
                                              Text(datas.title,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                      color: Colors.white)),
                                              Container(
                                                child: Text(
                                                    datas.price.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    )),
                                              ),
                                            ])),
                                  ));
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    }),
              ],
            ),
            const SizedBox(height: 15),
            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'View all',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Image(
                image: AssetImage('assets/images/banner.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'Shop from our Instagran',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<ProductModel>(
                future: productController.dataModelFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        primary: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          var datas = snapshot.data!.products[index];
                          return InkWell(
                              onTap: () => print("click"),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Container(
                                    decoration: const BoxDecoration(
                                        color: Colors.white12,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.network(datas.image,
                                              fit: BoxFit.contain),
                                          Text(datas.title,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                  color: Colors.white)),
                                          Text(datas.price.toString(),
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white,
                                                fontSize: 12,
                                              )),
                                        ])),
                              ));
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Our Exclusive Collections',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Image(
                    image: AssetImage('assets/images/necklace.png'),
                  ),
                  Image(
                    image: AssetImage('assets/images/necklace2.png'),
                  ),
                  Image(
                    image: AssetImage('assets/images/ring.png'),
                  ),
                  Image(
                    image: AssetImage('assets/images/ring2.png'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTileCard(
              image: 'assets/images/ring2.png',
              label: 'Get Exclusive Discounts',
              btnText: 'Give me Gifts',
              subTitle: 'Get Ones',
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTileCard(
              image: 'assets/images/women_ring.png',
              label: 'Not Sure of Steeping Out',
              subTitle: 'Not Sure of Steeping Out',
              btnText: 'Book Now',
            ),
            const SizedBox(
              height: 15,
            ),
            const ListTileCard(
              image: 'assets/images/women_ring.png',
              label: 'Not Sure of Steeping Out',
              subTitle: 'Not Sure of Steeping Out',
              btnText: 'Book Now',
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                'Customer Testimonials',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20 * 3,
            ),
            Center(
              child: Column(
                children: [
                  const Text(
                    'Rahul Desai',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        initialRating: 5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '5.0',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Image(
                    image: AssetImage('assets/images/ring2.png'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      '“Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor “',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      )))
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ]),
        ));
  }
}
