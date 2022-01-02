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
          fit: BoxFit.contain,
          height: 100,
          width: 100,
        ),
        const SizedBox(
          height: 13,
        ),
        Center(
          child: Text('$label',
              style: TextStyle(color: Colors.white, fontSize: 12)),
        ),
      ],
    );
  }
}
