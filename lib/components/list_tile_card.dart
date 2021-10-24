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
          height: 200,
          width: MediaQuery.of(context).size.width / 1.10,
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding:const EdgeInsets.symmetric(horizontal: 20),
                child: Image(
                  image: AssetImage(image),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    label,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 30,
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
                            borderRadius: BorderRadius.circular(15)),
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