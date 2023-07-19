// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_search_form.dart';
import 'package:workout_app/components/main_button.dart';
import 'package:workout_app/utils/api.dart';

import '../utils/models.dart';
import '../utils/style_variables.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  // late Future<Exercise> futureExercise;
  late Future<List<Exercise>> futureExercises;
  // late Future<ExerciseList> futureExerciseList;

  @override
  void initState() {
    super.initState();
    // futureExerciseList = fetchExerciseList();
    futureExercises = fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Exercises',
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              // print('fetch results: $futureExercises');
              // print('fetch results: $futureExerciseList');
            },
            child: MainButton(
              foregroundColor: Colors.white,
              backgroundColor: mainThemeColour,
              borderColor: Colors.grey,
              text: 'Add exercise',
              boxWidth: mainButtonSize,
              boxHeight: mainRectButtonHeight,
            ),
          ),
          const CustomSearchForm(),
          Container(
            height: 350,
            width: 350,
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.all(25),
            child: SizedBox(
              // scrollDirection: Axis.vertical,
              child: FutureBuilder(
                  future: futureExercises,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // return Text(snapshot.data![0].exerciseName);
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(snapshot.data![index].exerciseName),
                              subtitle: Text(snapshot.data![index].muscle),
                              trailing: Text(snapshot.data![index].equipment),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text('Error: $snapshot.error');
                    }
                    return const CircularProgressIndicator();
                  }),
            ),
          )
        ],
      )),
    );
  }
}

// 


/* 

FutureBuilder(
  future: futureExercise,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      print(snapshot.data!.exerciseId);
      return Text(snapshot.data!.toString());
    } else if (snapshot.hasError) {
      return Text('Error: $snapshot.error');
    } else {
      return const CircularProgressIndicator();
    }
  })


 */