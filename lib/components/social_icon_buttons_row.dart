import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';

class SocialIconButtonsRow extends StatelessWidget {
  const SocialIconButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(),
        SocialButtonWithShadow(
          icon: FontAwesomeIcons.facebookF,
          color: const Color(0xFF4267B2),
          onPressed: () {},
        ),
        SocialButtonWithShadow(
          icon: FontAwesomeIcons.twitter,
          color: const Color(0xFF1DA1F2),
          onPressed: () {},
        ),
        SocialButtonWithShadow(
          icon: FontAwesomeIcons.googlePlusG,
          color: const Color(0xFFDB4437),
          onPressed: () {},
        ),
        const SizedBox(),
      ],
    );
  }
}

class SocialButtonWithShadow extends StatelessWidget {
  const SocialButtonWithShadow(
      {Key? key, required this.icon, required this.color, this.onPressed})
      : super(key: key);

  final Color color;
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 45,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          elevation: MaterialStateProperty.all(12),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          backgroundColor: MaterialStateProperty.all(color),
          shadowColor: MaterialStateProperty.all(color),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ).p(8),
      ),
    );
  }
}
