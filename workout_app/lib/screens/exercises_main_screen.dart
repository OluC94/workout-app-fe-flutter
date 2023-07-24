import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_search_form.dart';
import 'package:workout_app/components/main_button.dart';
import 'package:workout_app/screens/add_exercise_screen.dart';
import 'package:workout_app/screens/exercise_detail.dart';
import 'package:workout_app/utils/api.dart';
import 'package:workout_app/utils/util_functions.dart';

import '../utils/models.dart';
import '../utils/style_variables.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  late Future<List<Exercise>> futureExercises;

  @override
  void initState() {
    super.initState();
    futureExercises = fetchExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: 'Exercises',
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print(fetchNinjaExercises()); // <--- THIS IS A LIST NOW
              navToScreen(context, const AddExercise());
            },
            child: MainButton(
              foregroundColor: Colors.white,
              backgroundColor: mainThemeColour,
              borderColor: Colors.grey,
              text: 'Add new exercise',
              boxWidth: mainButtonSize,
              boxHeight: mainRectButtonHeight,
            ),
          ),
          const CustomSearchForm(),
          Container(
            height: 350,
            width: 350,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(5),
            child: SizedBox(
              child: FutureBuilder(
                  future: futureExercises,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          padding: const EdgeInsets.all(10),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: GestureDetector(
                                  onTap: () {
                                    navToScreen(
                                        context,
                                        ExerciseDetail(
                                            id: snapshot
                                                .data![index].exerciseId));
                                  },
                                  child:
                                      Text(snapshot.data![index].exerciseName),
                                ),
                                subtitle: Text(snapshot.data![index].muscle
                                    .parseMuscleName()),
                                trailing: Text(snapshot.data![index].equipment),
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
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
