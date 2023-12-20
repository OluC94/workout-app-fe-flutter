import 'package:flutter/material.dart';

class ExerciseExpansionCard extends StatelessWidget {
  final List exercises;

  const ExerciseExpansionCard({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return exercises.isNotEmpty
        ? SizedBox(
            height: 80,
            width: 250,
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                shrinkWrap: true,
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  return Text(exercises[index]["ExerciseName"]);
                }))
        : const Text("No exercsies listed");
  }
}
