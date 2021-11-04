import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Exchange extends StatefulWidget {
  @override
  _ExchangeState createState() => _ExchangeState();
}

class _ExchangeState extends State<Exchange> {
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
            "Cancellations & Exchanges Policy",
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
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          'Whether you clicked on Place Order too soon or you didn’t just fall in love with ',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 26,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                    TextSpan(
                      text: 'The Pink Lane ',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    TextSpan(
                      text:
                          "product you just bought, we're here to help you fix it!\n",
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
              Text(
                "Below is our policy on Cancellations and Exchanges and anything else that would bring that smile back:\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "1. Cancellations\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "You can cancel your order anytime before it is processed by going to your My Account page and selecting the order and clicking on Cancel. If the Cancel option is not available, then it means we have already ready to dispatch your order, so you will need to contact us directly in order to initiate the cancellation process. To contact us, please call +91 966-966-0666 and send an email with your complete order information to ordermanagement@thepinklane.in\n\nWe will be able to accept order change or cancellation requests any time before we ship your order. Unfortunately, we cannot cancel orders once the shipment is out of our warehouse for delivery.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "2. Tampered Packaging\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "If you believe your desired The Pink Lane product hasn’t reached you in good condition, or if the packaging is tampered with or damaged, please refuse to take delivery of the package, and contact our Customer Care at wecare@thepinklane.in mentioning your order reference number. We shall re-deliver your order at the earliest possible time.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "3. Eligibility of  Exchanges\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Much as we would like to accept your exchanges at any time, to be fair to all parties involved in the creation of The Pink Lane designs, products have been categorised as eligible/ineligible for exchanges. Products that are eligible can be returned within one week (7 days) of being delivered.\n\nEligible products include:\n\na. Products that arrive damaged or defective.\n\nb. Products that are delivered in error. \n\nc. Any unboxed product that is in perfect resalable condition with original packaging and receipts intact (unless the product is marked as non-exchangeable on the product description page)\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "4. Damaged Product(s)\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "We take great care to ensure that your  “The Pink Lane”  products reach you in excellent condition. In the unlikely event that your  “The Pink Lane”  product is damaged or has a manufacturing defect, or that we have delivered a product that you did not order, you must register a complaint with us within forty-eight (48) hours of receiving the product.\n\nYou should email us a photo of the damaged product at ask@thepinklane.in The products will be reviewed by our customer service team and will be eligible for immediate replacement. The means of settling this replacement lie at your discretion:\n\na. You may choose to have us send you a replacement of the appropriate item immediately OR\n\nb. You may choose to get a full refund on your credit card or debit card or a return cash payment in the event of a COD purchase OR\n\nc. You may choose to get a full refund in the form of credits to your The Pink Lane account, which can be applied to future purchases.\n\nPlease note that all original shipping charges are non-refundable. The refund process will be completed within 5-7 working days, once the return product is received and after our Quality Control team gives its approval\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "5. Registering A Return Request\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Please provide the following details while registering your Return Request: Order Number, Invoice Number, Order Date & Amount, and Nature of Complaint.\n\nWe will issue a Return Request number as reference. Our courier will collect the package from you by giving reference to your Return Request number and will issue an Airway bill. Please do not hand over the parcel to courier unless an Airway bill is issued to you.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "6. Return Credits\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "In the event of non-damaged goods that are being returned, once we have received the returned product and verified its re-saleability, we will gladly offer you an exchange or credits, as outlined below:\n\na. If the wrong product was delivered to you by mistake, we will ship the correct product to you immediately upon receipt of your returned item.\n\nb. For unworn products that you simply wish to return, The Pink Lane will issue you a credit note to your The Pink Lane account or valid email id, which can be applied to a future purchase. A 10% restocking fee will be applied and all return and reshipment shipping charges will be borne by the customer.\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Text(
                "7. All exchanges are subject to the discretion of The Pink Lane\n",
                textAlign: TextAlign.justify,
                style: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ),
              Text(
                "Please know that our Exchanges Policy has been created to facilitate the process and ensure your love for The Pink Lane products continues. After all, we’re happy when you’re happy!\n\nShould you have any questions regarding the Exchanges Policy, please ask@thepinklane.in\n",
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
