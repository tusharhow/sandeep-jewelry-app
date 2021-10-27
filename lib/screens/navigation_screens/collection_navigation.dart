import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/appbar_primary.dart';
import 'package:sandeep_jwelery/components/list_card_vertical.dart';

class CollectionNavigation extends StatelessWidget {
  const CollectionNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: secondaryAppbarWithOption(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    ListCard(
                      image: 'assets/images/ring2.png',
                      label: 'Kids Jewelry',
                      priceLabel: 'Starting at ',
                      price: '₹2555',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListCard(
                      image: 'assets/images/ring.png',
                      label: 'Kids Jewelry',
                      priceLabel: 'Starting at ',
                      price: '₹2555',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListCard(
                      image: 'assets/images/necklace.png',
                      label: 'Kids Jewelry',
                      priceLabel: 'Starting at ',
                      price: '₹2555',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListCard(
                      image: 'assets/images/ring2.png',
                      label: 'Kids Jewelry',
                      priceLabel: 'Starting at ',
                      price: '₹2555',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListCard(
                      image: 'assets/images/ring.png',
                      label: 'Kids Jewelry',
                      priceLabel: 'Starting at ',
                      price: '₹2555',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
