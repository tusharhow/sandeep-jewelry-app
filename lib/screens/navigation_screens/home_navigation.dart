import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandeep_jwelery/components/house_of_collection_card.dart';
import 'package:sandeep_jwelery/components/list_tile_card.dart';
import 'package:sandeep_jwelery/components/shop_carousel.dart';
import 'package:sandeep_jwelery/components/todays_deals_card.dart';

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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  ShopCarousel(
                    image: 'assets/images/human.png',
                    label: 'Kids',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ShopCarousel(
                    image: 'assets/images/human2.png',
                    label: 'Men',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ShopCarousel(
                    image: 'assets/images/human3.png',
                    label: 'Women',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ShopCarousel(
                    image: 'assets/images/hand.png',
                    label: 'Charms',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ShopCarousel(
                    image: 'assets/images/jewl_set.png',
                    label: 'Jewelry Set',
                  ),
                ],
              ),
            ),
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  TodaysDealsCard(
                    label: 'Ring (Size 8)',
                    labelImage: 'assets/images/ring.png',
                    productDesc: '34 gm , 24kt Gold',
                    rating: 5.0,
                    ratingLevel: '5.0',
                    ratingCount: '(834)',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TodaysDealsCard(
                    label: 'Neckale (2 mts)',
                    labelImage: 'assets/images/necklace.png',
                    productDesc: '200 gm , Pt ,Ruby',
                    rating: 4.3,
                    ratingLevel: '4.3',
                    ratingCount: '(84)',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TodaysDealsCard(
                    label: 'Ring (Size 8)',
                    labelImage: 'assets/images/ring.png',
                    productDesc: '34 gm , 24kt Gold',
                    rating: 5.0,
                    ratingLevel: '5.0',
                    ratingCount: '(834)',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  TodaysDealsCard(
                    label: 'Neckale (2 mts)',
                    labelImage: 'assets/images/necklace.png',
                    productDesc: '200 gm , Pt ,Ruby',
                    rating: 4.3,
                    ratingLevel: '4.3',
                    ratingCount: '(84)',
                  ),
                ],
              ),
            ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    HouseOfCollectionCard(
                      imageLabel: 'assets/images/ring2.png',
                      label: 'Neckale (2 mts)',
                      price: '₹25550',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HouseOfCollectionCard(
                      imageLabel: 'assets/images/necklace2.png',
                      label: 'Ring (2 mts)',
                      price: '₹25550',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    HouseOfCollectionCard(
                      imageLabel: 'assets/images/ring.png',
                      label: 'Neckale (2 mts)',
                      price: '₹25550',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HouseOfCollectionCard(
                      imageLabel: 'assets/images/necklace.png',
                      label: 'Ring (2 mts)',
                      price: '₹25550',
                    ),
                  ],
                ),
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    HouseOfCollectionCard(
                      imageLabel: 'assets/images/ring2.png',
                      label: 'Neckale (2 mts)',
                      price: '₹25550',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HouseOfCollectionCard(
                      imageLabel: 'assets/images/necklace2.png',
                      label: 'Ring (2 mts)',
                      price: '₹25550',
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    HouseOfCollectionCard(
                      imageLabel: 'assets/images/ring.png',
                      label: 'Neckale (2 mts)',
                      price: '₹25550',
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    HouseOfCollectionCard(
                      imageLabel: 'assets/images/necklace.png',
                      label: 'Ring (2 mts)',
                      price: '₹25550',
                    ),
                  ],
                ),
              ],
            ),
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
              label: 'Get Exclusive\n Discounts',
              btnText: 'Give me Gifts',
              subTitle: 'Get Ones',
            ),
            const SizedBox(
              height: 20,
            ),
            const ListTileCard(
              image: 'assets/images/women_ring.png',
              label: 'Not Sure of Steeping\n Out',
              subTitle: 'Not Sure of Steeping\n Out',
              btnText: 'Book Now',
            ),
            const SizedBox(
              height: 15,
            ),
            const ListTileCard(
              image: 'assets/images/women_ring.png',
              label: 'Not Sure of Steeping\n Out',
              subTitle: 'Not Sure of Steeping\n Out',
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


