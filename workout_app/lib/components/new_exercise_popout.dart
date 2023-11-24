import 'package:flutter/material.dart';
import 'package:workout_app/utils/api.dart';
import 'package:workout_app/utils/models.dart';

class NewExercisePopout extends StatefulWidget {
  const NewExercisePopout({
    Key? key,
    this.name = '',
    this.muscle = '',
    this.equipment = '',
    this.instructions = '',
    this.boxHeight = 200,
    this.boxWidth = 200,
  }) : super(key: key);

  final String name;
  final String instructions;
  final String muscle;
  final String equipment;
  final double boxHeight;
  final double boxWidth;

  @override
  State<NewExercisePopout> createState() => _NewExercisePopoutState();
}

class _NewExercisePopoutState extends State<NewExercisePopout> {
  late Exercise newExercise;

  @override
  void initState() {
    super.initState();
    newExercise = Exercise(
        exerciseId: 101,
        exerciseName: widget.name,
        muscle: widget.muscle,
        equipment: widget.equipment,
        instructions: widget.instructions);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.name),
      content: SizedBox(
          height: widget.boxHeight,
          width: widget.boxWidth,
          child: SingleChildScrollView(
            child: Text(widget.instructions),
          )),
      actions: [
        ElevatedButton(
            onPressed: () => {addExercise(newExercise)},
            child: const Text("Save exercise")),
        ElevatedButton(
            onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            child: const Text("Cancel")),
      ],
    );
  }
}
