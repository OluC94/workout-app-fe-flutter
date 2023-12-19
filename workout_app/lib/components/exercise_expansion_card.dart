import 'package:flutter/material.dart';

class ExerciseExpansionCard extends StatefulWidget {
  const ExerciseExpansionCard({super.key});

  @override
  State<ExerciseExpansionCard> createState() => _ExerciseExpansionCardState();
}

class _ExerciseExpansionCardState extends State<ExerciseExpansionCard> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 80,
      width: 250,
      child: Text("Bring in the list of Exercises - display exercise names"),
    );
  }
}
