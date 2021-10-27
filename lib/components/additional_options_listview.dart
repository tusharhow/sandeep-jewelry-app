import 'package:flutter/material.dart';

class AdditionalOptionsListView extends StatelessWidget {
  const AdditionalOptionsListView({
    Key? key,
    @required this.icon,
    @required this.label,
  }) : super(key: key);
  final icon;
  final label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 55,
        width: MediaQuery.of(context).size.width / 1.15,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(icon),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Spacer(),
              Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
