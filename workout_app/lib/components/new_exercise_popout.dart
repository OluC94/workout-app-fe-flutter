import 'package:flutter/material.dart';

class NewExercisePopout extends StatelessWidget {
  const NewExercisePopout({
    Key? key,
    this.name = '',
    this.instructions = '',
    this.boxHeight = 200,
    this.boxWidth = 200,
  }) : super(key: key);

  final String name;
  final String instructions;
  final double boxHeight;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(name),
      content: SizedBox(
          height: boxHeight,
          width: boxWidth,
          child: SingleChildScrollView(
            child: Text(instructions),
          )),
      actions: const [
        ElevatedButton(onPressed: null, child: Text("Save exercise")),
        ElevatedButton(onPressed: null, child: Text("Cancel")),
      ],
    );
  }
}
