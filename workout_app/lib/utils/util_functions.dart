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

bool isExistingExercise(String exerciseName, List dbExercises) {
  // function needs to be called as list of Ninja exercises is generated
  // check if the name provided exists in the list provided by the BE
  // print(exerciseName);
  // print(dbExercises[0].length);

  // extract exercise list from future exercises

  return true;
}
