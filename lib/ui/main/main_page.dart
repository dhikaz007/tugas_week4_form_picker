import 'package:flutter/material.dart';

import '../../feature/menu/menu_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Menu')),
      body: const MenuPage(),
    );
  }
}
