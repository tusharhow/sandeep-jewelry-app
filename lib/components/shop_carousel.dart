import 'package:flutter/material.dart';

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