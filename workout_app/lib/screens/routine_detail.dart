import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_list_container.dart';
import 'package:workout_app/components/exercise_expansion_card.dart';
import 'package:workout_app/utils/api.dart';
import 'package:workout_app/utils/models.dart';

class RoutineDetail extends StatefulWidget {
  final int id;
  final String title;

  const RoutineDetail({super.key, required this.id, required this.title});

  @override
  State<RoutineDetail> createState() => _RoutineDetailState();
}

class _RoutineDetailState extends State<RoutineDetail> {
  late Future<Routine> futureRoutineData;
  late String routineTitle;

  @override
  void initState() {
    super.initState();
    futureRoutineData = fetchRoutineById(widget.id);
    routineTitle = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: routineTitle,
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
            " 'Add a day to this routine' with a '+' icon, gesture detector, rnew branch"),
        CustomListContainer(
            dataDisplay: SizedBox(
          child: FutureBuilder(
              future: futureRoutineData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      padding: const EdgeInsets.all(20),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.routineDays.length,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          leading: GestureDetector(
                            onTap: () {
                              print("nav to day");
                            },
                            child: const Icon(Icons.info),
                          ),
                          title: Text(
                              snapshot.data!.routineDays[index]["DayName"]),
                          children: const [ExerciseExpansionCard()],
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ))
      ])),
    );
  }
}
