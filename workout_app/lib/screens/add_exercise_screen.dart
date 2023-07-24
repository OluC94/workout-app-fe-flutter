import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({super.key});

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: 'Add new exercise',
      ),
      body: Center(
        child: Text('new exercise page'),
      ),
    );
  }
}
