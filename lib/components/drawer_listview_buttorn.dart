import 'package:flutter/material.dart';

class DrawerListViewButton extends StatelessWidget {
  const DrawerListViewButton({Key? key, @required this.label})
      : super(key: key);
  final label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width / 1.10,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style:const TextStyle(fontSize: 16, color: Colors.white),
              ),
           const   Spacer(),
           const   Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
