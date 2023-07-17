import 'package:flutter/material.dart';

class RoutineCard extends StatefulWidget {
  final int id;

  const RoutineCard({super.key, required this.id});

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("placeholder"),
        ],
      ),
    );
  }
}

// Routine Id
// routine name
// no. of workout days (no RoutineDay where DayExercises > 0)