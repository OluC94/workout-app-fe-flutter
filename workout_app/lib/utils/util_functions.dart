import 'package:flutter/material.dart';

void navToScreen(
  BuildContext context,
  Widget screen,
) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((BuildContext context) => screen),
    ),
  );
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String parseMuscleName() {
    return replaceAll('_', ' ').capitalize();
  }
}
