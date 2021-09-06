import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryTextField extends StatelessWidget {
  PrimaryTextField({
    this.hintText = '',
    IconData? icon,
    Key? key,
  }) : super(key: key);
  IconData? icon;
  String hintText;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 16,
      shadowColor: Colors.black54,
      child: TextFormField(
        controller: null,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 16),
            prefixIcon: icon != null
                ? Icon(
                    icon,
                    size: 18,
                    color: Theme.of(context).colorScheme.onSurface,
                  )
                : const SizedBox.shrink(),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodyText2),
      ).px(24),
    );
  }
}
