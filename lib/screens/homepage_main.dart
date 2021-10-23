import 'package:flutter/material.dart';

class HomePageMain extends StatefulWidget {
  HomePageMain({Key? key}) : super(key: key);

  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {},
          child: Image(
            image: AssetImage('assets/icons/menu.png'),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Image(
              image: AssetImage('assets/icons/search.png'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Image(
              image: AssetImage('assets/icons/heart.png'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image(
                image: AssetImage('assets/icons/basket.png'),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image(
                    image: AssetImage('assets/images/caro2.png'),
                    color: Colors.black38,
                    colorBlendMode: BlendMode.hardLight,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
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
                          child: Center(
                            child: Text('Browse Now'),
                          )),
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Shop for',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
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
            SizedBox(
              height: 25,
            ),
            Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Today’s Deals',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}

class ShopCarousel extends StatelessWidget {
  const ShopCarousel({
    Key? key,
    @required this.image,
    @required this.label,
  }) : super(key: key);
  final image;
  final label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 5,
        ),
        Center(
          child: Text(label,
              style: const TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ],
    );
  }
}
