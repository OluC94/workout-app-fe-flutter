import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_list_container.dart';
import 'package:workout_app/utils/api.dart';
import 'package:workout_app/utils/util_functions.dart';

class AddExercise extends StatefulWidget {
  const AddExercise({super.key});

  @override
  State<AddExercise> createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  final _formKey = GlobalKey<FormState>();
  String inputValue = '';
  late Future<List> ninjaExercises;

  @override
  void initState() {
    super.initState();

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
                  height: 150,
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
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              ninjaExercises = fetchNinjaExercises(inputValue);
                            });
                            print(ninjaExercises);
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
                      // return Text('${snapshot.data!}');
                      // print('snapshot: ${snapshot.data![0].runtimeType}');
                      return ListView.builder(
                          padding: const EdgeInsets.all(10),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                  title: Text(snapshot.data![index]['name']),
                                  subtitle: Text(
                                      '${snapshot.data![index]['muscle']}'
                                          .parseMuscleName()),
                                  trailing:
                                      Text(snapshot.data![index]['equipment']),
                                  leading: GestureDetector(
                                    onTap: () => {
                                      print(
                                          "alert, with exrcise details, add exercise to DB on confirmation")
                                    },
                                    child: const Icon(
                                      Icons.add,
                                    ),
                                  )),
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
