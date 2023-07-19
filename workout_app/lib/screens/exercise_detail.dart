import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/utils/api.dart';

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
        title: 'Exercise Placeholder',
      ),
      body: Center(
        child: SizedBox(
          child: FutureBuilder(
              future: futureExerciseData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text("${snapshot.data!}");
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
