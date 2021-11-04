import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  const ListCard({
    Key? key,
    @required this.image,
    @required this.label,
    @required this.price,
    @required this.priceLabel,
  }) : super(key: key);
  final image;
  final label;
  final price;
  final priceLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width / 1.15,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image(
              image: AssetImage(image),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                label,
                textAlign: TextAlign.justify,
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    priceLabel,
                    textAlign: TextAlign.justify,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  Text(
                    price,
                    textAlign: TextAlign.justify,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
