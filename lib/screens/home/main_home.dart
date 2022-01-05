import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:ecommerce_app_isaatech/constants/colors.dart';
import 'package:ecommerce_app_isaatech/screens/home/home_screens/home_screen.dart';
import 'package:ecommerce_app_isaatech/screens/profile_screen.dart';

import '../../components/bottom_bar_custom.dart';
import '../../components/buttons.dart';
import '../../constants/images.dart';

class UserDashboard extends StatefulWidget {
  static const String id = '/user-dashboard';
  UserDashboard({
    Key? key,
    this.child,
  }) : super(key: key);
  Widget? child;
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard>
    with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: duration);

    _scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation =
        Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0))
            .animate(_controller);
    super.initState();
    if (widget.child == null)
      widget.child = MainScreen(
        child: Container(),
        toggleDrawer: toggleDrawer,
      );

    WidgetsBinding.instance!.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleDrawer() {
    setState(() {
      if (isCollapsed)
        _controller.forward();
      else
        _controller.reverse();

      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColors.customGrey,
      // floatingActionButton: (isCollapsed)
      //     ? FloatingActionButton(
      //         elevation: 1,
      //         onPressed: toggleDrawer,
      //         mini: true,
      //         backgroundColor: CustomColors.customGrey,
      //         child: const Icon(CupertinoIcons.sidebar_left),
      //       )
      //     : const SizedBox(),
      body: !isCollapsed
          ? SafeArea(
              child: Stack(
                children: <Widget>[
                  menu(context),
                  Dashboard(
                    child: widget.child == null
                        ? MainScreen(child: Container())
                        : widget.child!,
                    duration: duration,
                    isCollapsed: isCollapsed,
                    scaleAnimation: _scaleAnimation,
                    toggleDrawer: toggleDrawer,
                  ),
                ],
              ),
            )
          : Stack(
              children: [
                menu(context),
                Dashboard(
                  child: widget.child == null
                      ? MainScreen(child: Container())
                      : widget.child!,
                  duration: duration,
                  isCollapsed: isCollapsed,
                  scaleAnimation: _scaleAnimation,
                  toggleDrawer: toggleDrawer,
                ),
              ],
            ),
    );
  }

  Widget menu(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: ScaleTransition(
        scale: _menuScaleAnimation,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 48, bottom: 32),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //   SvgPicture.asset(Images.logoWhite),
                    MaterialButton(
                      onPressed: () {},
                      highlightColor: CustomColors.customGrey,
                      child: Text(
                        'Sign Out',
                        style: dashboardButtonText,
                      ),
                    ).px(16)
                  ],
                ),
                48.heightBox,
                GestureDetector(
                  onTap: () {
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            // widget.child = _user == null
                            //     ? LoginScreen(isUser: true)
                            //     : ProfileScreen();
                            // toggleDrawer();
                          });
                        },
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(200)),
                          child: const CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(Images.avatar),
                          ),
                        ),
                      ),
                      16.widthBox,
                      Text(
                        'Rashid Wassan',
                        style: dashboardButtonText,
                      ),
                      4.widthBox,
                      true
                          ? true
                              ? Container(
                                  height: 15,
                                  width: 15,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue),
                                  child: const Icon(
                                    Icons.check,
                                    size: 10,
                                    color: Colors.white,
                                  ),
                                )
                              : const Icon(
                                  Icons.warning,
                                  color: Colors.white,
                                  size: 15,
                                )
                          : const SizedBox.shrink()
                    ],
                  ),
                ),
                const Divider(),
                8.heightBox,
                _dashboardSidebarButton(
                    text: 'Discover',
                    icon: CupertinoIcons.home,
                    onTap: () {
                      setState(() {
                        widget.child = MainScreen(
                          child: Container(),
                          toggleDrawer: toggleDrawer,
                        );
                        toggleDrawer();
                      });
                    }),
                const Divider(),
                _dashboardSidebarButton(
                    text: 'Cart Items',
                    icon: CupertinoIcons.list_number,
                    onTap: () {
                      setState(() {
                        toggleDrawer();
                      });
                    }),
                const Divider(),
                _dashboardSidebarButton(
                  text: 'Purchases',
                  icon: CupertinoIcons.time,
                  onTap: () {},
                ),
                const Divider(),
                _dashboardSidebarButton(
                    text: 'Seller Chats',
                    icon: CupertinoIcons.chat_bubble,
                    onTap: () {}),
                const Divider(),
                const Spacer(),
                Row(
                  children: [
                    _dashboardSidebarButton(
                        text: 'Settings',
                        icon: CupertinoIcons.settings,
                        onTap: () {
                          setState(() {
                            toggleDrawer();
                          });
                        }),
                    24.widthBox,
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    // SvgPicture.asset(
                    //   Images.logoWhite,
                    //   height: 35,
                    // ),
                    8.widthBox,
                    Text(
                      'BazaarOnline',
                      style: dashboardButtonText,
                    ),
                  ],
                ),
                16.heightBox,
                Row(
                  children: [
                    4.widthBox,
                    // SvgPicture.asset(
                    //   Images.settings,
                    // ),
                    16.widthBox,
                    Text(
                      'Organization Settings',
                      style: dashboardButtonText.copyWith(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ).pOnly(left: 8),
          ),
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 180,
      child: Divider(
        color: Colors.white,
        height: 25,
        thickness: 0.5,
        indent: 48,
      ),
    );
  }
}

Widget _dashboardSidebarButton(
    {required IconData icon, required String text, required Function() onTap}) {
  return Row(
    children: [
      SizedBox(
          height: 35,
          width: 35,
          child: Icon(
            icon,
            color: Colors.white,
          ).p(7)),
      MaterialButton(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        onPressed: onTap,
        child: Text(text, style: dashboardButtonText),
      ),
    ],
  );
}

class Dashboard extends StatefulWidget {
  const Dashboard(
      {Key? key,
      required this.duration,
      required this.child,
      required this.isCollapsed,
      required this.scaleAnimation,
      required this.toggleDrawer})
      : super(key: key);
  final Duration duration;
  final bool isCollapsed;
  final Animation<double> scaleAnimation;
  final Widget child;
  final Function() toggleDrawer;

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenWidth, screenHeight;
    screenHeight = size.height;
    screenWidth = size.width;
    return AnimatedPositioned(
        duration: widget.duration,
        top: 0,
        bottom: 0,
        left: widget.isCollapsed ? 0 : 0.5 * screenWidth,
        right: widget.isCollapsed ? 0 : -0.5 * screenWidth,
        child: ScaleTransition(
          scale: widget.scaleAnimation,
          child: widget.isCollapsed
              ? Stack(children: [
                  (widget.child == null)
                      ? MainScreen(
                          child: Container(),
                          toggleDrawer: widget.toggleDrawer,
                        )
                      : widget.child,
                  SizedBox(
                    width: 15,
                    child: GestureDetector(
                      onHorizontalDragEnd: (details) => widget.toggleDrawer,
                    ),
                  )
                ])
              : Stack(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    decoration: const BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        double.infinity.widthBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            16.widthBox,
                            MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () => widget.toggleDrawer,
                              highlightColor: CustomColors.customGrey,
                              child: Text(
                                'Back to browsing',
                                style: dashboardButtonText,
                              ),
                            ),
                          ],
                        ),
                        16.heightBox,
                      ],
                    ),
                  ),
                  Material(
                    elevation: 2,
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: widget.child),
                  ).pOnly(left: 12, bottom: 70),
                ]),
        ));
  }
}

TextStyle dashboardButtonText = const TextStyle(
    fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white);

class MainScreen extends StatefulWidget {
  static const String id = '/homescreen';
  const MainScreen({Key? key, required this.child, this.toggleDrawer})
      : super(key: key);

  final Widget child;
  final Function()? toggleDrawer;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<String> _titlesList;
  int _currentPage = 0;
  late List<Widget> _pages;

  updateCurrentPage(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  @override
  void initState() {
    _titlesList = ['Shoes', '1', '2', '3', 'Rashid Wassan'];
    _pages = [
      const HomeScreen(),
      const Center(child: Text('2')),
      const Center(child: Text('3')),
      const Center(child: Text('4')),
      const UserProfileScreen(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          onPressed: widget.toggleDrawer,
        ),
        title: Text(_titlesList[_currentPage]),
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
