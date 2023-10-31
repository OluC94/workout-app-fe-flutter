import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_list_container.dart';
import 'package:workout_app/utils/api.dart';
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

  @override
  void initState() {
    super.initState();
    selectedDropdownValue = muscleList[0];
    searchMuscle = '';
    ninjaExercises = fetchNinjaExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Add new exercise',
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
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            inputValue = value;
                          });
                        },
                      ),
                      DropdownButton(
                        value: selectedDropdownValue,
                        menuMaxHeight: 500,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        underline: Container(
                          height: 2,
                          color: mainThemeColour,
                        ),
                        padding: const EdgeInsets.all(5),
                        items: muscleList
                            .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e.parseMuscleName()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          print(value);
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
                                              builder: (context) => AlertDialog(
                                                    title: Text(snapshot
                                                        .data![index]['name']),
                                                    content: SizedBox(
                                                      height: 450,
                                                      width: 250,
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Text(snapshot
                                                                .data![index]
                                                            ['instructions']),
                                                      ),
                                                    ),
                                                    actions: const [
                                                      ElevatedButton(
                                                          onPressed: null,
                                                          child: Text(
                                                              "Save exercise")),
                                                      ElevatedButton(
                                                          onPressed: null,
                                                          child:
                                                              Text("Cancel")),
                                                    ],
                                                  ))
                                        },
                                        child:
                                            Text(snapshot.data![index]['name']),
                                      ),
                                      // Text(snapshot.data![index]['name']),
                                      subtitle: Text(
                                          '${snapshot.data![index]['muscle']}'
                                              .parseMuscleName()),
                                      trailing: Text(
                                          snapshot.data![index]['equipment']),
                                      leading: GestureDetector(
                                          onTap: () => {
                                                print(
                                                    "alert, with exrcise details, add exercise to DB on confirmation"),
                                              },
                                          child: const Icon(
                                            Icons.add,
                                          ))),
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

/* 
Next steps:
 - add to backend with error handling (hover window with full details + confirmation)
 - long tap for quick add(?)

New exercise popup:
- add logic to check whether new exercise is already in BE
- need to do the check on addition attempt --> don't pass Instance of DB data through props

Click on + sign to add exercise
- show a popup with the loading wheel
- check that the eercise is not already in the db
- Send appropriate msg 

To-dos:
 - add filter to exercise list
 - 


 */