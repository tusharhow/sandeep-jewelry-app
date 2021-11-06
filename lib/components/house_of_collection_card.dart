import 'package:flutter/material.dart';

class HouseOfCollectionCard extends StatelessWidget {
  const HouseOfCollectionCard({
    Key? key,
    @required this.label,
    @required this.price,
    @required this.imageLabel,
  }) : super(key: key);
  final label;
  final price;
  final imageLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Image(
            image: NetworkImage(imageLabel),
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            ' \$ $price',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
