import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SimilarProductGrid extends StatelessWidget {
  const SimilarProductGrid({
    Key? key,
    required this.img,
    required this.label,
    required this.desc,
    required this.amount,
  }) : super(key: key);
  final img;
  final label;
  final desc;
  final amount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // push(context: context, widget: ProductDetailView(
        //   prodName: da,
        // ));
      },
      child: Stack(
        children: [
          Container(
            height: 220,
            width: 170,
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
                  image: NetworkImage(img),
                  height: 100,
                  width: 100,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        desc,
                        style: TextStyle(color: Colors.white54, fontSize: 12),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 15,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            '5.0 (834)',
                            style:
                                TextStyle(color: Colors.white54, fontSize: 11),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            '₹${amount}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '₹${9550}',
                            style: TextStyle(
                                color: Colors.white54,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
