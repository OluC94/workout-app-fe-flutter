import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/utils/api.dart';
import 'package:workout_app/utils/util_functions.dart';

import '../utils/models.dart';

class ExerciseDetail extends StatefulWidget {
  final int id;

  const ExerciseDetail({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<ExerciseDetail> createState() => _ExerciseDetailState();
}

class _ExerciseDetailState extends State<ExerciseDetail> {
  late Future<Exercise> futureExerciseData;

  @override
  void initState() {
    super.initState();
    futureExerciseData = fetchExerciseById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Instructions',
      ),
      body: Center(
        child: SizedBox(
          child: FutureBuilder(
              future: futureExerciseData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapshot.data!.exerciseName),
                      Text(snapshot.data!.muscle.parseMuscleName()),
                      Text(snapshot.data!.equipment),
                      SizedBox(
                        height: 450,
                        width: 350,
                        child: ListView(
                            padding: const EdgeInsets.all(20),
                            shrinkWrap: true,
                            children: [
                              Text(
                                snapshot.data!.instructions,
                                style: const TextStyle(fontSize: 20),
                              )
                            ]),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
