import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdditionalOptionsListView extends StatelessWidget {
   AdditionalOptionsListView({
    Key? key,
    @required this.icon,
    required this.onpress,
    @required this.label,
  }) : super(key: key);
  final icon;
  final label;
  Function onpress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress as  VoidCallback,
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
              const SizedBox(
                width: 15,
              ),
              Text(
                label,
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right,
                  color: Colors.white, size: 30),
            ],
          ),
        ),
      ),
    );
  }
}
