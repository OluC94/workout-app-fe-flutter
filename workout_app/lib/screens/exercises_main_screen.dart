import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_list_container.dart';
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
  late List<Exercise> currentExercises;
  final _formKey = GlobalKey<FormState>();
  String searchName = '';
  String searchMuscle = '';
  String searchEquipment = '';

  @override
  void initState() {
    super.initState();
    searchName = '';
    searchMuscle = '';
    searchEquipment = '';
    currentExercises = [];
    futureExercises = fetchExercises().then(
      (exerciseData) {
        setState(() {
          currentExercises = exerciseData;
        });
        return exerciseData;
      },
    );
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
          // const CustomSearchForm(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: SizedBox(
                    width: 300,
                    height: 175,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Search existing exercises'),
                        TextFormField(onChanged: (value) {
                          setState(() {
                            searchName = value;
                          });
                        }),
                        // Dropdowns button here
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                futureExercises = fetchExercises(
                                    searchName, searchMuscle, searchEquipment);
                              });
                            },
                            child: const Icon(Icons.search))
                      ],
                    ),
                  )),
              CustomListContainer(
                dataDisplay: SizedBox(
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
                                      child: Text(
                                          snapshot.data![index].exerciseName),
                                    ),
                                    subtitle: Text(snapshot.data![index].muscle
                                        .parseMuscleName()),
                                    trailing:
                                        Text(snapshot.data![index].equipment),
                                  ),
                                );
                              });
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        return const CircularProgressIndicator();
                      }),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
