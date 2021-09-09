import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  static const String id = '/homescreen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shoes'),
        actions: [
          IconButton(
            icon: const Icon(
              CupertinoIcons.cart_fill,
              size: 27,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  SizedBox _buildBottomNavigationBar() {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 16),
            padding: const EdgeInsets.only(bottom: 24, top: 6),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _bottomBarButton(
                  icon: Icons.home_filled,
                  index: 0,
                ),
                _bottomBarButton(
                  icon: Icons.favorite,
                  index: 1,
                ),
                const SizedBox(
                  width: 50,
                ),
                _bottomBarButton(
                  icon: CupertinoIcons.bell_fill,
                  index: 3,
                ),
                _bottomBarButton(
                  icon: CupertinoIcons.mail_solid,
                  index: 4,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: _buildBottomBarMiddleButton().pOnly(bottom: 32),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBarMiddleButton() {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextButton(
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          elevation: MaterialStateProperty.all(8),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.onSurface),
        ),
        child: Container(
          width: 55,
          height: 55,
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.black87],
                  center: Alignment.topLeft,
                  radius: 1)),
          child: Icon(
            CupertinoIcons.cart_fill,
            color: (_currentIndex == 2) ? Colors.purple.shade200 : Colors.white,
          ).p(8),
        ),
      ),
    );
  }

  Widget _bottomBarButton({required IconData icon, required int index}) {
    return SizedBox(
      width: 50,
      height: 40,
      child: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: const EdgeInsets.all(0),
          onPressed: () {
            setState(() {
              _currentIndex = index;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Icon(
              icon,
              color: index == _currentIndex
                  ? Theme.of(context).colorScheme.onSurface
                  : Colors.grey,
            ),
          )),
    );
  }
}
