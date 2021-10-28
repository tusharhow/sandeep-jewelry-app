import 'package:carousel_pro/carousel_pro.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/radio/gf_radio.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/size/gf_size.dart';
import 'package:getwidget/types/gf_radio_type.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailView extends StatefulWidget {
  ProductDetailView({Key? key}) : super(key: key);

  @override
  _ProductDetailViewState createState() => _ProductDetailViewState();
}

class _ProductDetailViewState extends State<ProductDetailView> {
  final List<String> imgList = [
    "assets/images/jew2.png",
    "assets/images/jew3.png",
    "assets/images/jew2.png",
  ];
  int tag = 1;
  List<String> options = [
    '21',
    '25',
  ];
  bool tapped = false;
  int groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'data',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.transparent),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3.60,
                  width: MediaQuery.of(context).size.width,
                  child: Carousel(
                    images: List.generate(imgList.length, (int index) {
                      return Column(
                        children: [
                          Image(
                            image: AssetImage(imgList[index]),
                            height: 200,
                            width: 200,
                          ),
                        ],
                      );
                    }),
                    autoplay: false,
                    dotSize: 6,
                    dotPosition: DotPosition.bottomCenter,
                    dotColor: Colors.green,
                    dotIncreaseSize: 2,
                    dotIncreasedColor: Colors.amber,
                    indicatorBgPadding: 1,
                    dotBgColor: Colors.black12.withOpacity(0),
                    boxFit: BoxFit.contain,
                  ),
                ),
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
                Container(
                  alignment: Alignment.bottomLeft,
                  child: const Text('EmbededGold Ring ',
                      style: TextStyle(fontSize: 23, color: Colors.white)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: const Text('₹${5455}',
                          style: TextStyle(fontSize: 25, color: Colors.white)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      '₹${5455}',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        decoration: TextDecoration.lineThrough,
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
                    'Price Breakage',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.amber,
                      decoration: TextDecoration.underline,
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
                      width: MediaQuery.of(context).size.width / 2.80,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                '-',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.amber),
                              )),
                          Text(
                            '2',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                '+',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.amber),
                              )),
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
                        btnColor: Color(0xff393939)),
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
                    ChipsChoice<int>.single(
                      choiceStyle: const C2ChoiceStyle(color: Colors.white),
                      value: tag,
                      choiceActiveStyle:
                          const C2ChoiceStyle(color: Colors.amber),
                      onChanged: (val) => setState(() => tag = val),
                      choiceItems: C2Choice.listFrom<int, String>(
                        source: options,
                        value: (i, v) => i,
                        label: (i, v) => v,
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
                  children: [
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
                AboutThisProduct(
                    label: 'Brand', labelDesc: 'Sandeep Jewellers'),
                const SizedBox(
                  height: 15,
                ),
                AboutThisProduct(label: 'hsn Code', labelDesc: 'skiwya'),
                const SizedBox(
                  height: 15,
                ),
                AboutThisProduct(
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
                      const SizedBox(
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
                  height: 15,
                ),
              ],
            )),
      ),
    );
  }
}

class AboutThisProduct extends StatelessWidget {
  const AboutThisProduct({
    Key? key,
    @required this.label,
    @required this.labelDesc,
  }) : super(key: key);
  final label;
  final labelDesc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        const SizedBox(
          width: 60,
        ),
        Flexible(
          child: Text(
            labelDesc,
            style: TextStyle(color: Colors.white54),
          ),
        ),
      ],
    );
  }
}

class MiniButton extends StatelessWidget {
  const MiniButton({
    Key? key,
    @required this.btnColor,
    @required this.btnText,
    @required this.btnTextColor,
    required this.onPressed,
  }) : super(key: key);
  final btnColor;
  final btnText;
  final btnTextColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 2.30,
        decoration: BoxDecoration(
            color: btnColor, borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(color: btnTextColor, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
