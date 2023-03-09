import 'package:flutter/material.dart';

class AltaListTile extends StatelessWidget {
  const AltaListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final IconData icon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
      ),
      leading: Icon(icon),
      style: ListTileStyle.drawer,
      onTap: onTap,
    );
  }
}
