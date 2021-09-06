import 'dart:ui';

import 'package:ecommerce_app_isaatech/components/blur_container.dart';
import 'package:ecommerce_app_isaatech/components/social_icon_buttons_row.dart';
import 'package:ecommerce_app_isaatech/components/textfields.dart';
import 'package:ecommerce_app_isaatech/constants/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginScreen extends StatelessWidget {
  static const String id = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              Images.loginBg,
            ),
            fit: BoxFit.cover,
          )),
        ),
        BlurContainer(value: 2),
        SafeArea(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                double.infinity.widthBox,
                const Spacer(),
                _buildTitleText(context),
                const Spacer(),
                PrimaryTextField(
                  hintText: 'Name',
                  icon: Icons.person,
                ),
                24.heightBox,
                PrimaryTextField(
                  hintText: 'Password',
                  icon: CupertinoIcons.padlock,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: const ButtonStyle(),
                      child: const Text(
                        'Forgot your password?',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    24.widthBox,
                  ],
                ),
                const Spacer(),
                const SocialIconButtonsRow(),
              ],
            ).p(16),
          ),
        ),
      ]),
    );
  }

  Column _buildTitleText(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hello',
          style: TextStyle(
              fontSize: 85,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.onBackground),
        ),
        Text(
          'Sign in to your account',
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }
}
