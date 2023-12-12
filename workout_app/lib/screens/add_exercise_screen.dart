import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_basic_alert.dart';
import 'package:workout_app/components/custom_list_container.dart';
import 'package:workout_app/components/new_exercise_popout.dart';
import 'package:workout_app/utils/api.dart';
import 'package:workout_app/utils/models.dart';
import 'package:workout_app/utils/style_variables.dart';
import 'package:workout_app/utils/util_functions.dart';
import 'package:workout_app/utils/util_variables.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({
    Key? key,
  }) : super(key: key);

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  final _formKey = GlobalKey<FormState>();
  String inputValue = '';
  String selectedDropdownValue = '';
  String searchMuscle = '';
  late Future<List> ninjaExercises;
  late Exercise newExercise;

  @override
  void initState() {
    super.initState();
    selectedDropdownValue = muscleList[0];
    searchMuscle = '';
    ninjaExercises = fetchNinjaExercises();
    newExercise = Exercise(
        exerciseId: 0,
        exerciseName: '',
        muscle: '',
        equipment: '',
        instructions: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Save new exercises',
      ),
      body: Center(
        child: Column(
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
                      const Text('Filter by exercise name'),
                      TextFormField(onChanged: (value) {
                        setState(() {
                          inputValue = value;
                        });
                      }),
                      DropdownButton(
                        value: selectedDropdownValue,
                        menuMaxHeight: 500,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        underline: Container(height: 2, color: mainThemeColour),
                        padding: const EdgeInsets.all(5),
                        items: muscleList
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.parseMuscleName()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedDropdownValue = (value as String);
                            value == muscleList[0]
                                ? searchMuscle = ''
                                : searchMuscle = value;
                          });
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              ninjaExercises =
                                  fetchNinjaExercises(inputValue, searchMuscle);
                            });
                          },
                          child: const Icon(Icons.search)),
                    ],
                  ),
                )),
            CustomListContainer(
                dataDisplay: SizedBox(
              child: FutureBuilder(
                  future: ninjaExercises,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isEmpty
                          ? const Text('No results found')
                          : ListView.builder(
                              padding: const EdgeInsets.all(10),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                      title: GestureDetector(
                                        onTap: () => {
                                          showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  NewExercisePopout(
                                                    name: snapshot.data![index]
                                                        ['name'],
                                                    instructions:
                                                        snapshot.data![index]
                                                            ['instructions'],
                                                    equipment:
                                                        snapshot.data![index]
                                                            ['equipment'],
                                                    muscle: snapshot
                                                        .data![index]['muscle'],
                                                    boxHeight: 450,
                                                    boxWidth: 250,
                                                  ))
                                        },
                                        child:
                                            Text(snapshot.data![index]['name']),
                                      ),
                                      subtitle: Text(
                                          '${snapshot.data![index]['muscle']}'
                                              .parseMuscleName()),
                                      trailing: Text(
                                          snapshot.data![index]['equipment']),
                                      leading: GestureDetector(
                                          onTap: () => {
                                                newExercise = Exercise(
                                                    exerciseId: 101,
                                                    exerciseName: snapshot
                                                        .data?[index]['name'],
                                                    muscle: snapshot
                                                        .data?[index]['muscle'],
                                                    equipment:
                                                        snapshot.data?[index]
                                                            ['equipment'],
                                                    instructions:
                                                        snapshot.data?[index]
                                                            ['instructions']),
                                                addExercise(newExercise)
                                                    .then((value) => {
                                                          showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                Future.delayed(
                                                                    const Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                                return CustomBasicAlert(
                                                                    keyWord: snapshot
                                                                            .data?[index]
                                                                        [
                                                                        'name'],
                                                                    actionDescriptor:
                                                                        "added");
                                                              })
                                                        })
                                                    .catchError((onError) => {
                                                          showDialog(
                                                              context: context,
                                                              builder: (context) =>
                                                                  const AlertDialog(
                                                                    title: Text(
                                                                        "Something went wrong"),
                                                                    icon: Icon(Icons
                                                                        .error),
                                                                  ))
                                                        })
                                              },
                                          child: const Icon(Icons.add))),
                                );
                              });
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }),
            ))
          ],
        ),
      ),
    );
  }
}
