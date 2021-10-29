import 'package:flutter/material.dart';

class AboutThisProduct extends StatelessWidget {
  const AboutThisProduct({
    Key? key,
    @required this.label,
    @required this.labelDesc,
  }) : super(key: key);
  final label;
  final labelDesc;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
        const SizedBox(
          width: 60,
        ),
        Flexible(
          child: Text(
            labelDesc,
            style: const TextStyle(color: Colors.white54),
          ),
        ),
      ],
    );
  }
}
