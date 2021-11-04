import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shipping extends StatefulWidget {
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  int dol1 = 150;
  int dol2 = 30;

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
            "Shipping and Delivery",
            style: TextStyle(color: Colors.white),
          ),
        ),
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "You came. You loved what you saw. You bought it.\n\nNow, it's our turn to ensure that your favourite product reaches you on time and in excellent condition.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 26,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                "1. Packaging\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "At the pink lane, we believe whole-heartedly in protection of the environment. We also believe in supporting social causes in India that benefit women, children and all those in need. As such, we have partnered with an NGO that makes recycled paper as well as beautiful products. We work with our NGO partner to create our cards from recycled paper and to create our hand-made jewellery boxes. We do not pack each and every product in its own box as we find this would be wasteful. Rather, we pack each product in its own individual protective wrapper and then pack several products together in one pouch for delivery. In most cases, we will give our customers a lovely hand-made jewellery box as an added gift when we deliver their orders valued at Rs 2,000 and above. At the current time, we are not charging customers for this jewellery box, which doubles as an elegant gift box.\n\nIn some cases, customers request additional gift boxes. We are happy to provide a separate pouch (on request only) for each product ordered (up to a max of 5 per order). However, customers who wish to have multiple boxes should contact Customer Care at ask@thepinklane.in to arrange to receive multiple boxes. There will be a nominal charge for each additional box ordered.\n\nOur packaging philosophy is designed to help us deliver to our customers a beautiful experience end-to-end while at the same time fulfilling our objectives to help the community and to reduce the e-commerce waste footprint. We are delighted that our like-minded customers are happy with our packaging design and philosophy.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "2. Order Confirmation & Tracking\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "When you place an order with the pink lane, we send you an email that confirms your order. Upon shipping, we send you another email. You can easily track your order with the details mentioned in this email. In case of any difficulty, you can contact our Customer Care at ask@thepinklane.in\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "3. Shipping Partners\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "We want your the pink lane items to be delivered to you in excellent condition, and always on time. Taking great care in delivering your order, we only ship through reputed courier agencies\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "4. Shipping Locations\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Presently, we accept orders from the following countries. We will continue to expand the list as we grow:\n\nIndia, USA, UK, France, Australia, Canada, Singapore, Germany, Mexico, United Arab Emirates (UAE), New Zealand\n\nMissing out on the pink lane products? If you wish your location to be fastracked and added to our list please send a note to ask@thepinklane.in \n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "5. Shipping Times\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                "We work with India's largest and most-established domestic and international couriers to ensure the broadest delivery coverage across the countries we service.\n\nThese courier partners are always expanding their delivery coverage areas on a regular basis. The best way to check whether we ship to your region is to type in your PIN code on any product page and click on the Verify button. You will get real-time information on whether we can ship pre-paid or cash on delivery in your area.\n\nPlease note that for orders outside of India and for certain PIN codes within India, the Cash on Delivery option is not available.\n\nOrders generally are delivered within 3-7 working days after order confirmation for metro cities within India. For non-metro Indian cities and international locations, customers can expect orders to reach them within 7-10 working days. Please note that these times reflect the general guidelines and are subject to change due to weather, other environmental conditions or high traffic times. the pink lane is not responsible for any delays in the delivery process once a package has shipped from our warehouse. If customers require special delivery timeframes or conditions, they should contact our customer service team upon order placement with the details (ordermanagement@thepinklane.in).\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "6. Shipping Fees & Entry Taxes\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Orders shipped within India:\n\n- standard shipping is FREE for orders of Rs. 2000 or more*\n\n- All orders below Rs. 2000 will incur a shipping fee of Rs. 90 per order\n\n- All COD orders will incur a handling/insurance fee of Rs. 110 per order\n\n- express shipping is chargeable and availability varies by PIN code -- please check the availability of express shipping for your PIN code from the shopping cart page\n\n- all shipping fees are added directly to the order total within the shopping cart at the time of checkout\n\n- Shipping & COD Charges are inclusive of taxes\n\n* certain PIN codes within India are not covered as part of the standard delivery process and, as such are chargeable at a flat shipping fee of Rs 300 per order.\n\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "Orders shipped outside India:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "- Cash on Delivery is not available\n\n- the pink lane offers FREE shipping for orders of US \$$dol1 or more\n\n- shipping is chargeable @ US \$$dol2 for orders of less than US \$$dol1\n\n- Any custom duty levied will be borne by the customer\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "7. Partial deliveries\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "While we would like you to enjoy your entire order together, this may not always be possible due to product unavailability, and we may have to make partial deliveries. But please be assured, we won’t rest easy till your complete order has been delivered to you.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "8. Exchanges\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "If you believe your desired the pink lane product hasn’t reached you in good condition, or if the packaging is tampered with or damaged, please refuse to take delivery of the package, and contact our Customer Care at wecare@thepinklane.in  mentioning your order reference number. We shall re-deliver your order at the earliest possible time.\n\nPlease read the Exchange Policy for further clarification.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "Note: Some products are not eligible for returns. These products will be marked on the product description page as such. Also, none of the items in the Sale category are eligible for exchanges.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "9. Cancellations\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "We will be able to accept order change or cancellation requests any time before we dispatch your order. Unfortunately, we cannot cancel orders once the shipment is out of our warehouse for delivery.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "2. Order Confirmation & Tracking\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "When you place an order with the pink lane, we send you an email that confirms your order. Upon shipping, we send you another email. You can easily track your order with the details mentioned in this email. In case of any difficulty, you can contact our Customer Care at ask@thepinklane.in\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "10. Cash on Delivery\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "We offer both online payments as well as Cash on Delivery (COD) options within India. All COD orders will incur a nominal fee of Rs 110 per order for handling/insurance. However, for certain PIN codes in India, we are able to offer only pre-paid online payment as an option. Please enter your PIN code on any product page to verify the shipping and payment options for your PIN code.\n\nPlease note that the Cash on Delivery option is not available for orders that are shipped outside of India.\n\nCustomers will be given the option to use Cash on Delivery only if the following conditions are true for their orders:\n\na) Our courier partners offer Cash on Delivery as an option for that PIN code\n\nb) The Billing Address and the Shipping Address are the same\n\nc) All COD orders will incur a nominal Rs. 110 fee for handling/insurance purposes\n\nd) All COD orders will be confirmed via phone/OTP\n",
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
