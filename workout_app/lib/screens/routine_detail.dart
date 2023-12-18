import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_list_container.dart';
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
        const Text("Big round '+' icon"),
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
                        return Card(
                            child: GestureDetector(
                          onTap: () {},
                          child: ListTile(
                              title: Text(snapshot.data!.routineDays[index]
                                  ["DayName"])),
                        ));
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
