import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_list_container.dart';
import 'package:workout_app/components/main_button.dart';
import 'package:workout_app/screens/add_exercise_screen.dart';
import 'package:workout_app/screens/exercise_detail.dart';
import 'package:workout_app/utils/api.dart';
import 'package:workout_app/utils/util_functions.dart';
import 'package:workout_app/utils/util_variables.dart';

import '../utils/models.dart';
import '../utils/style_variables.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  late Future<List<Exercise>> currentExercises;
  final _formKey = GlobalKey<FormState>();
  String searchName = '';
  String searchMuscle = '';
  String searchEquipment = '';
  String selectedDropdownValueMuscle = '';
  String selectedDropdownValueEquipment = '';

  @override
  void initState() {
    super.initState();
    searchName = '';
    searchMuscle = '';
    searchEquipment = '';
    selectedDropdownValueMuscle = muscleList[0];
    selectedDropdownValueEquipment = equipmentList[0];
    currentExercises = fetchExercises();
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
                    width: 330,
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
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DropdownButton(
                                  value: selectedDropdownValueMuscle,
                                  menuMaxHeight: 400,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                  underline: Container(
                                      height: 2, color: mainThemeColour),
                                  padding: const EdgeInsets.all(5),
                                  items: muscleList
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e.parseMuscleName()),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDropdownValueMuscle =
                                          (value as String);
                                      value == muscleList[0]
                                          ? searchMuscle = ''
                                          : searchMuscle = value;
                                    });
                                  }),
                              DropdownButton(
                                  value: selectedDropdownValueEquipment,
                                  menuMaxHeight: 400,
                                  icon: const Icon(
                                      Icons.arrow_drop_down_outlined),
                                  underline: Container(
                                      height: 2, color: mainThemeColour),
                                  padding: const EdgeInsets.all(5),
                                  items: equipmentList
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e.parseMuscleName()),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDropdownValueEquipment =
                                          (value as String);
                                      value == equipmentList[0]
                                          ? searchEquipment = ''
                                          : searchEquipment = value;
                                    });
                                  }),
                            ]),
                        // Dropdown button here - use a different popout for selecting equipment
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                currentExercises = fetchExercises(
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
                      future: currentExercises,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!.isEmpty
                              ? const Text('No exercises found')
                              : ListView.builder(
                                  padding: const EdgeInsets.all(20),
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
                                                    id: snapshot.data![index]
                                                        .exerciseId));
                                          },
                                          child: Text(snapshot
                                              .data![index].exerciseName),
                                        ),
                                        subtitle: Text(snapshot
                                            .data![index].muscle
                                            .parseMuscleName()),
                                        trailing: Text(
                                            snapshot.data![index].equipment),
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
