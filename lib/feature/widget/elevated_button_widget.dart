import 'package:flutter/material.dart';

class AltaElevatedButton extends StatelessWidget {
  const AltaElevatedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.backgroundColor,
      this.minimumSize,
      this.shape});
  final VoidCallback onPressed;
  final Widget child;
  final MaterialStateProperty<Color>? backgroundColor;
  final MaterialStateProperty<Size?>? minimumSize;
  final MaterialStateProperty<OutlinedBorder?>? shape;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: backgroundColor,
          minimumSize: minimumSize,
          shape: shape),
      onPressed: onPressed,
      child: child,
    );
  }
}
