import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TodaysDealsCard extends StatelessWidget {
  const TodaysDealsCard({
    Key? key,
    @required this.label,
    @required this.labelImage,
    @required this.rating,
    @required this.ratingLevel,
    @required this.ratingCount,
    @required this.productDesc,
  }) : super(key: key);
  final label;
  final labelImage;
  final rating;
  final ratingLevel;
  final ratingCount;
  final productDesc;

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
            image: NetworkImage(labelImage ??
                'https://cdn.pixabay.com/photo/2015/12/01/20/28/road-1072821__340.jpg'),
            height: 50,
            width: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            label ?? '',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            productDesc ?? '',
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                RatingBar.builder(
                  initialRating: rating ?? 0,
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
                Text(
                  ratingLevel ?? '',
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  ratingCount ?? '',
                  style: const TextStyle(color: Colors.white54, fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
