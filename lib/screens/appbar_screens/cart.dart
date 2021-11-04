import 'package:flutter/material.dart';
import 'package:sandeep_jwelery/components/re_usable_buttons/primary_button.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: ReusablePrimaryButton(
                  childText: 'Proceed',
                  buttonColor: const Color(0xffFFD809),
                  textColor: Colors.black,
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
