import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_search_form.dart';
import 'package:workout_app/components/main_button.dart';

import '../utils/style_variables.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Exercises',
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: MainButton(
              foregroundColor: Colors.white,
              backgroundColor: mainThemeColour,
              borderColor: Colors.grey,
              text: 'Add exercise',
              boxWidth: mainButtonSize,
              boxHeight: mainRectButtonHeight,
            ),
          ),
          const CustomSearchForm(),
          Container(
            height: 350,
            width: 350,
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.all(25),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: const [Text('Exercises placeholder')],
            ),
          )
        ],
      )),
    );
  }
}

// 
