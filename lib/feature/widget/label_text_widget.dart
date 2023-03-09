import 'package:flutter/material.dart';

class AltaLabelText extends StatelessWidget {
  const AltaLabelText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }
}
