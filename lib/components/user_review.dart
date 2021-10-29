import 'package:flutter/material.dart';

class UserReview extends StatelessWidget {
  const UserReview({
    Key? key,
  }) : super(key: key);

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/user.png'),
            ),
          ),
          Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Row(
                children: const [
                  Text('Akhil Jewel',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
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
                  Text('5.0 (834)',
                      style: TextStyle(color: Colors.white54, fontSize: 9)),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Flexible(
                child: Text(
                    'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Amet elit non nisl sem.',
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 11,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
