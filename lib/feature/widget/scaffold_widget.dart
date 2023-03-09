import 'package:flutter/material.dart';

class AltaScaffold extends StatelessWidget {
  const AltaScaffold(
      {super.key,
      required this.title,
      required this.body,
      this.child,
      this.accountName,
      this.accountEmail,
      this.backgroundColor,
      this.leading,
      this.currentAccountPicture});
  final String title;
  final Widget body;
  final Widget? child;
  final Widget? accountName;
  final Widget? accountEmail;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? currentAccountPicture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: child,
      ),
      appBar: AppBar(
        leading: leading,
        title: Text(title),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: body,
    );
  }
}
