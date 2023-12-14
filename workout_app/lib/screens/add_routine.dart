import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';

class AddRoutine extends StatefulWidget {
  const AddRoutine({super.key});

  @override
  State<AddRoutine> createState() => _AddRoutineState();
}

class _AddRoutineState extends State<AddRoutine> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: "Create new routine",
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text("Form"), Text("CustomListContainer")],
      )),
    );
  }
}
