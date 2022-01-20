import 'package:flutter/material.dart';

class UserReview extends StatelessWidget {
  const UserReview({
    Key? key,
    required this.name,
    required this.desc,
    required this.count,
  }) : super(key: key);
  final name;
  final desc;
  final count;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: MediaQuery.of(context).size.width / 1.15,
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          //  Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 20),
          //   child: CircleAvatar(
          //     radius: 30,
          //     backgroundImage: NetworkImage(img),
          //   ),
          // ),
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20 * 2),
                    child: Text(
                      name,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.star, color: Colors.amber, size: 15),
                  Icon(Icons.star, color: Colors.amber, size: 15),
                  Icon(Icons.star, color: Colors.amber, size: 15),
                  Icon(Icons.star, color: Colors.amber, size: 15),
                  Icon(Icons.star, color: Colors.amber, size: 15),
                  SizedBox(
                    width: 5,
                  ),
                  Text('${count} (834)',
                      style: TextStyle(color: Colors.white54, fontSize: 9)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: Text(
                  desc,
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 11,
                  ),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
