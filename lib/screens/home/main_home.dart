import 'package:ecommerce_app_isaatech/constants/colors.dart';
import 'package:ecommerce_app_isaatech/constants/images.dart';
import 'package:ecommerce_app_isaatech/screens/home/home_screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../components/bottom_bar_custom.dart';

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
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          onPressed: () {},
        ),
        title: const Text('Shoes'),
        actions: [
          const BagButton(
            numberOfItemsPurchased: 3,
          ),
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

class BagButton extends StatelessWidget {
  const BagButton({Key? key, this.numberOfItemsPurchased}) : super(key: key);
  final int? numberOfItemsPurchased;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        IconButton(
          icon: Image.asset(
            Images.shoppingBag,
            height: 28,
          ),
          onPressed: () {},
        ),
        if (numberOfItemsPurchased != null || numberOfItemsPurchased != 0)
          Container(
            margin: const EdgeInsets.only(right: 4, top: 8),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: CustomColors.darkBlue,
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: Colors.white)),
            child:
                numberOfItemsPurchased.toString().text.sm.makeCentered().p(2),
          ),
      ],
    );
  }
}
