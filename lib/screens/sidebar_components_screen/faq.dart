import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Faq extends StatefulWidget {
  @override
  _FaqState createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Center(
          child: Text(
            "FAQs",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1.	Are the products made in pure silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "The products with the silver metal specification are made of pure Sterling 925 Silver. (Sterling silver is an alloy of silver which is composed of 92.5% silver, and the remaining 7.5% is made up of other metals. Whereas, fine silver consists of 99.9% pure silver, which makes the metal soft and it cannot be used for jewellery items.) Sterling Silver is considered the worldwide jewellery industry’s highest quality of silver purity for use in making jewellery.\n\nRead more (Was this article helpful? Yes/ No)\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "RELATED QUESTIONS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "1.	Will I get a certificate of authenticity?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 26,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "2.	How long does gold plating last?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "3.	How is Sterling Silver different from Normal Silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "2. Will I get a certificate of authenticity?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Read more We guarantee the purity of our products to be as stated on our website. We will provide a certificate of authenticity for purchases upon request.\n\n(Was this article helpful? Yes / No)\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "RELATED QUESTIONS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "1. Are the products made in pure silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "2. How long does gold plating last?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "3. How is Sterling Silver different from Normal Silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "3. How long does gold plating last?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "1. (Any plating (whether it is gold, rose gold, rhodium or other) will last based on two things:  1) the ‘thickness’ of the plating  and 2) the usage and care given by the owner. Flash plating is a very thin layer; whereas micron plating provides a heavier layer and therefore will last longer. The best way to keep your plated jewellery looking like new is to ensure you are following the care instructions. Do not expose the jewellery to high heat, excessive moisture or chemicals (including perfumes) and make sure to store it in airtight bags while not wearing it.\n\n(Was this article helpful? Yes  / No)\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "RELATED QUESTIONS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "1. Are the products made in pure silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "2. How long does gold plating last?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "3. How is Sterling Silver different from Normal Silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "4. How is Sterling Silver different from Normal Silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Sterling silver is an alloy of silver consisting of 92.5% silver and 7.5% other materials such as copper. On the other hand, pure silver, also termed as fine silver, consists of 99.9% pure silver. Due to its high durability, sterling silver is the industry standard highest quality of silver used for making jewellery.\n\n(Was this article helpful? Yes No)\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "RELATED QUESTIONS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "1. Are the products made in pure silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "2. How long does gold plating last?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "3. How is Sterling Silver different from Normal Silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "5. How to shop or buy your products?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Shopping at The Pink Lane is quite easy. You can shop online from the comfort of your home. Here is what you need to do once you land on the website: Browse through the products and choose the jewellery pieces that you want to buy. Click on the jewellery bag icon to add products into the shopping bag. You can proceed to the checkout page or continue shopping. One you have selected all of your products and added them into your bag, go to the checkout page, fill in your details including name, contact number, email address, shipping address and continue. Choose your mode of payment and complete the transaction. After the transaction is complete, you will receive a confirmation email on the email address that you have entered while placing the order.\n\n(Was this article helpful? Yes No)\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "RELATED QUESTIONS:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "1. Are the products made in pure silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "2. How long does gold plating last?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "3. How is Sterling Silver different from Normal Silver?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "6. What are your Exchange Policies?\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "You can find our exchange policies here:(Was this article helpful? Yes / No)\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
