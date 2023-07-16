import 'package:flutter/material.dart';

class RoutineCard extends StatelessWidget {
  const RoutineCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('placeholder1'),
          Text('placeholder2'),
          Text('placeholder3'),
        ],
      ),
    );
  }
}

// Routine Id
// routine name
// no. of workout days (no RoutineDay where DayExercises > 0)