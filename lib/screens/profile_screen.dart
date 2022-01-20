import 'package:ecommerce_app_isaatech/constants/images.dart';
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
          ProfileScreenCardView(),
        ],
      ),
    ).p(16);
  }
}

class ProfileScreenCardView extends StatelessWidget {
  const ProfileScreenCardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(0),
      elevation: 4,
      shadowColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          'Purchases'.text.lg.make(),
          Spacer(),
          Icon(Icons.keyboard_arrow_right)
        ],
      ).p(12),
    );
  }
}
