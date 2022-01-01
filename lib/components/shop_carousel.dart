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
          image: NetworkImage(image),
          fit: BoxFit.fill,
          height: 130,
          width: 120,
        ),
        const SizedBox(
          height: 8,
        ),
        Center(
          child: Text('$label',
              style: TextStyle(color: Colors.white, fontSize: 14)),
        ),
      ],
    );
  }
}
