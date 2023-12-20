import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_list_container.dart';
import 'package:workout_app/components/custom_search_form.dart';
// import 'package:workout_app/components/routine_card.dart';
import 'package:workout_app/screens/add_routine.dart';
import 'package:workout_app/screens/routine_detail.dart';
import 'package:workout_app/utils/api.dart';
import 'package:workout_app/utils/models.dart';
import 'package:workout_app/utils/style_variables.dart';
import 'package:workout_app/utils/util_functions.dart';

import '../components/main_button.dart';

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({super.key});

  @override
  State<RoutinesScreen> createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen> {
  late Future<List<Routine>> currentRoutines;

  @override
  void initState() {
    super.initState();
    currentRoutines = fetchRoutines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(
        title: "Routines",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                navToScreen(context, const AddRoutine());
              },
              child: MainButton(
                foregroundColor: Colors.white,
                backgroundColor: mainThemeColour,
                borderColor: Colors.grey,
                text: 'Create new routine',
                boxWidth: mainButtonSize,
                boxHeight: mainRectButtonHeight,
              ),
            ),
            const CustomSearchForm(),
            CustomListContainer(
                dataDisplay: SizedBox(
              child: FutureBuilder(
                  future: currentRoutines,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isEmpty
                          ? const Text('No routines found')
                          : ListView.builder(
                              padding: const EdgeInsets.all(20),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: GestureDetector(
                                    onTap: () {
                                      navToScreen(
                                          context,
                                          RoutineDetail(
                                            id: snapshot.data![index].routineId,
                                            title: snapshot
                                                .data![index].routineName,
                                          ));
                                    },
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index].routineName),
                                      subtitle: snapshot.data![index]
                                                  .routineDays.length ==
                                              1
                                          ? Text(
                                              "${snapshot.data![index].routineDays.length} day")
                                          : Text(
                                              "${snapshot.data![index].routineDays.length} days"),
                                    ),
                                  ),
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

void searchFunction() {}

// Routine Card
// form field - how to group? 
// From validation docs - https://docs.flutter.dev/cookbook/forms/validation
 