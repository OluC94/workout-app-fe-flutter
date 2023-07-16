import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainButton extends StatelessWidget {
  MainButton(
      {super.key,
      required this.foregroundColor,
      required this.backgroundColor,
      required this.borderColor,
      required this.text,
      required this.boxWidth,
      this.boxHeight,
      this.icon,
      this.isIcon});

  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderColor;
  final String text;
  IconData? icon;
  double boxWidth;
  double? boxHeight;
  bool? isIcon = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxWidth,
      height: boxHeight ?? boxWidth,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor,
            width: 1.0,
          )),
      child: Center(
        child: isIcon != true
            ? Text(
                text,
                style: TextStyle(
                  color: foregroundColor,
                  fontSize: 25,
                ),
              )
            : Icon(
                icon,
                color: foregroundColor,
              ),
      ),
    );
  }
}
