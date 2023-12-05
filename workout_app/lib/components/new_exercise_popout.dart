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
  bool addSuccessful = false;

  @override
  void initState() {
    super.initState();
    addSuccessful = false;
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => {
                        if (addSuccessful)
                          {}
                        else
                          {
                            addExercise(newExercise)
                                .then((value) =>
                                    {setState(() => addSuccessful = true)})
                                .catchError((err) => {
                                      setState(() => addSuccessful = false),
                                      print('$err')
                                    })
                          }
                      },
                  child: addSuccessful == false
                      ? const Text("Save exercise")
                      : const Icon(Icons.check)),
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                child: addSuccessful == false
                    ? const Text("Cancel")
                    : const Text("Close"),
              )
            ],
          )
        ]);
  }
}
