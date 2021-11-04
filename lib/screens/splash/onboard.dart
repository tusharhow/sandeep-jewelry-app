
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sandeep_jwelery/components/navigate.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';
import 'package:sandeep_jwelery/main.dart';

class Intro2 extends StatefulWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  _Intro2State createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  final List<String> imgList = [
    "assets/images/jew2.png",
    "assets/images/jew3.png",
    "assets/images/jew2.png",
  ];
  final List<String> namelist = [
    "UNIQUE DESIGN",
    "TRY AT HOME",
    "STORE",
  ];
  final List<String> labellist = [
    "We use 100% Pure Metals",
    "We use 100% Pure Metals",
    "We use 100% Pure Metals",
  ];

  final List<String> descriptionlist = [
    "So that you don't run out of options to choose from!",
    "Can't make up your mind? Get a free The pink Lane jewellery trial at your doorstep.",
    "Want a personal touch ? Visit our store and buy a free The pink Lane",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 1.15,
                width: MediaQuery.of(context).size.width,
                child: Carousel(
                  images: List.generate(imgList.length, (int index) {
                    return Column(
                      children: [
                    const    SizedBox(
                          height: 50,
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            labellist[index].toString(),
                            style: GoogleFonts.lora(
                              textStyle:const TextStyle(
                                color: Colors.white60,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                  
                    const    SizedBox(
                          height: 50,
                        ),
                        Image(
                          image: AssetImage(imgList[index]),
                          height: 350,
                          width: 350,
                        ),
                 const SizedBox(
                          height: 50,
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            namelist[index].toString(),
                            style: GoogleFonts.lora(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).size.width / 15,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          descriptionlist[index].toString(),
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 26,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
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
              //Spacer(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 22,
              ),

              ReusablePrimaryButton(
                childText: 'Get Started',
                onPressed: () {
                  push(context: context, widget:const HomePage());
                },
                buttonColor: Colors.white,
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
