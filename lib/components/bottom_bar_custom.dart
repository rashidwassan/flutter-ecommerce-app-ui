import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar(
      {Key? key, required this.updatePage, required this.currentHomeScreen})
      : super(key: key);

  final Function updatePage;
  final int currentHomeScreen;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
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
                BottomBarButton(widget.currentHomeScreen, 0, Icons.home_filled,
                    widget.updatePage),
                BottomBarButton(widget.currentHomeScreen, 1, Icons.favorite,
                    widget.updatePage),
                const SizedBox(
                  width: 50,
                ),
                BottomBarButton(widget.currentHomeScreen, 3,
                    CupertinoIcons.bell_fill, widget.updatePage),
                BottomBarButton(widget.currentHomeScreen, 4,
                    CupertinoIcons.person_fill, widget.updatePage),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: BottomBarMiddleButton(
                    widget.currentHomeScreen, widget.updatePage)
                .pOnly(bottom: 32),
          ),
        ],
      ),
    );
  }
}

class BottomBarMiddleButton extends StatelessWidget {
  const BottomBarMiddleButton(this.currentHomeScreen, this.updatePage,
      {Key? key})
      : super(key: key);
  final int currentHomeScreen;
  final Function updatePage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 55,
      height: 55,
      child: TextButton(
        onPressed: () => updatePage(2),
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
                  colors: [Colors.black.withOpacity(0.4), Colors.black87],
                  center: Alignment.topLeft,
                  radius: 1)),
          child: Icon(
            CupertinoIcons.cart_fill,
            color: (currentHomeScreen == 2)
                ? Colors.purple.shade200
                : Colors.white,
          ).p(8),
        ),
      ),
    );
  }
}

class BottomBarButton extends StatelessWidget {
  const BottomBarButton(
      this.currentPage, this.index, this.icon, this.updatePage,
      {Key? key})
      : super(key: key);
  final IconData icon;
  final int currentPage;
  final int index;
  final Function updatePage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 40,
      child: MaterialButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          padding: const EdgeInsets.all(0),
          onPressed: () => updatePage(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Icon(
              icon,
              color: index == currentPage
                  ? Theme.of(context).colorScheme.onSurface
                  : Colors.grey,
            ),
          )),
    );
  }
}
