import 'package:flutter/material.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({
    Key? key,
    this.label,
    this.image,
    this.btnText,
    this.subTitle,
  }) : super(key: key);
  final label;
  final image;
  final btnText;
  final subTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 170,
          width: MediaQuery.of(context).size.width / 1.15,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Image(
                  image: AssetImage(image),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    label,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    subTitle,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.white54, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        height: 45,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(btnText),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
