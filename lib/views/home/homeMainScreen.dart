import 'package:flutter/material.dart';
import 'package:supermarket_fe/views/aiPage.dart';
import 'package:supermarket_fe/views/category.dart';
import 'package:supermarket_fe/views/home/homePage.dart';
import 'package:supermarket_fe/views/offerPage.dart';
import 'package:supermarket_fe/views/reOrderPage.dart';
import 'package:supermarket_fe/widgets/bottom_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    Category(),
    Aipage(),
    Reorderpage(),
    Offerpage(),
  ];

  void _onBottomBarTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomBar(
        selectedIndex: selectedIndex,
        onItemSelected: _onBottomBarTap,
      ),
    );
  }
}
