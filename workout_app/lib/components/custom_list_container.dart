import 'package:flutter/material.dart';

class CustomListContainer extends StatelessWidget {
  const CustomListContainer({super.key, required this.dataDisplay});

  final Widget dataDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        width: 350,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        child: dataDisplay);
  }
}
