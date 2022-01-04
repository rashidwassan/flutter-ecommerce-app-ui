import 'package:ecommerce_app_isaatech/screens/home/home_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../components/bottom_bar_custom.dart';
import '../../components/buttons.dart';

class MainScreen extends StatefulWidget {
  static const String id = '/homescreen';
  const MainScreen({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentPage = 0;
  late List<Widget> _pages;

  updateCurrentPage(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  @override
  void initState() {
    _pages = [
      const HomeScreen(),
      const Center(child: Text('2')),
      const Center(child: Text('3')),
      const Center(child: Text('4')),
      const Center(child: Text('5')),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          onPressed: () {},
        ),
        title: const Text('Shoes'),
        actions: [
          const BagButton(),
          16.widthBox,
        ],
      ),
      body: _pages[_currentPage],
      bottomNavigationBar: CustomNavigationBar(
        updatePage: updateCurrentPage,
        currentHomeScreen: _currentPage,
      ),
    );
  }
}
