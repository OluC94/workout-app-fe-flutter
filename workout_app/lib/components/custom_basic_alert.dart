import 'package:flutter/material.dart';

class CustomBasicAlert extends StatelessWidget {
  const CustomBasicAlert({
    Key? key,
    required this.keyWord,
    required this.actionDescriptor,
  }) : super(key: key);

  final String keyWord;
  final String actionDescriptor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("$keyWord $actionDescriptor"),
        icon: const Icon(Icons.check));
  }
}
