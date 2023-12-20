import 'package:flutter/material.dart';

class CustomListContainer extends StatelessWidget {
  final Widget dataDisplay;
  final double customHeight;
  final double customMargin;

  const CustomListContainer(
      {super.key,
      required this.dataDisplay,
      this.customHeight = 350,
      this.customMargin = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: customHeight,
        width: 350,
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.all(customMargin),
        child: dataDisplay);
  }
}
