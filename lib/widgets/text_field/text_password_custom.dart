import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/text_field/text_field_custom.dart';

class TextPasswordCustom extends StatelessWidget {
  const TextPasswordCustom(
      {Key? key,
      required this.onChanged,
      required this.colorBackground,
      required this.colorIcon, required this.hintTextPassword})
      : super(key: key);
  final ValueChanged<String> onChanged;
  final Color colorBackground;
  final Color colorIcon;
  final String hintTextPassword;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      colorBackground: colorBackground,
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
            icon: Icon(
              Icons.password_outlined,
              color: colorIcon,
            ),
            hintText: hintTextPassword,
            border: InputBorder.none,
            suffixIcon: Icon(Icons.visibility, color: colorIcon)),
      ),
    );
  }
}