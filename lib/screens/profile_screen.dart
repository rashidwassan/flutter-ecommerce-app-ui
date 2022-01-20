import 'package:ecommerce_app_isaatech/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  static const String id = '/user-profile';

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(0),
            elevation: 10,
            shadowColor: Colors.grey.shade100,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 33,
                  backgroundImage: AssetImage(Images.avatar),
                ),
                12.widthBox,
                Column(
                  children: [
                    'Rashid Wassan'.text.xl2.semiBold.make(),
                    'rashidwassan@gmail.com'.text.sm.make(),
                  ],
                ),
              ],
            ).p(8),
          ),
          24.heightBox,
          ProfileScreenCardView(
            title: 'Purchases',
            accentColor: Colors.blue.shade200,
            icon: CupertinoIcons.cart,
            onPressed: () {},
          ),
          ProfileScreenCardView(
            title: 'History',
            accentColor: Colors.red.shade200,
            icon: CupertinoIcons.clock,
            onPressed: () {},
          ),
          ProfileScreenCardView(
            title: 'Favourites',
            accentColor: Colors.purple.shade200,
            icon: CupertinoIcons.heart,
            onPressed: () {},
          ),
          ProfileScreenCardView(
            title: 'Help & Support',
            accentColor: Colors.green.shade200,
            icon: CupertinoIcons.phone,
            onPressed: () {},
          ),
          ProfileScreenCardView(
            title: 'Rate Us',
            accentColor: Colors.amber.shade200,
            icon: CupertinoIcons.star,
            onPressed: () {},
          ),
        ],
      ),
    ).p(16);
  }
}

class ProfileScreenCardView extends StatelessWidget {
  const ProfileScreenCardView(
      {Key? key,
      required this.title,
      required this.accentColor,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String title;
  final Color accentColor;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 4,
      shadowColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: accentColor),
            child: Center(
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
          8.widthBox,
          title.text.lg.semiBold.make(),
          const Spacer(),
          const Icon(Icons.keyboard_arrow_right),
        ],
      ).p(12),
    );
  }
}
