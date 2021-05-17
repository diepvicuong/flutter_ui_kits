import 'package:flutter/material.dart';

class BorderTextFormField extends StatelessWidget {
  final Color? backgroundColor;
  final double? borderRadius;
  final Icon? prefixIcon;
  final String? hintText;

  const BorderTextFormField({
    Key? key,
    this.backgroundColor,
    this.borderRadius,
    this.prefixIcon,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 5)),
      child: TextFormField(
          decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: prefixIcon,
        hintText: hintText,
      )),
    );
  }
}
