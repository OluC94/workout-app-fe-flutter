import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.size,
      this.icon,
      this.isIcon});

  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  IconData? icon;
  double size;
  bool? isIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: borderColor,
            width: 1.0,
          )),
      child: Center(
        child: isIcon != true
            ? Text(
                text,
                style: TextStyle(color: foregroundColor),
              )
            : Icon(
                icon,
                color: foregroundColor,
              ),
      ),
    );
  }
}