import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class PrimaryTextField extends StatefulWidget {
  const PrimaryTextField({
    this.hintText = '',
    this.prefixIcon,
    this.isObscure = false,
    Key? key,
  }) : super(key: key);
  final IconData? prefixIcon;
  final String hintText;
  final bool isObscure;

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      elevation: 16,
      shadowColor: Colors.black54,
      child: TextFormField(
        validator: (v) {},
        obscureText: widget.isObscure,
        controller: null,
        style: Theme.of(context)
            .textTheme
            .bodyText1!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 14),
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    size: 20,
                    color: Theme.of(context).colorScheme.onBackground,
                  )
                : const SizedBox.shrink(),
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle:
                const TextStyle(fontSize: 17, fontWeight: FontWeight.normal)),
      ).px(12).py(2.5),
    );
  }
}
