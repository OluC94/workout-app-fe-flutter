import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/main_button.dart';
import 'package:workout_app/screens/exercises_main_screen.dart';
import 'package:workout_app/screens/routines_main_screen.dart';

import '../utils/style_variables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Home",
        leading: Icon(
          Icons.home,
          color: Colors.blueGrey,
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => navToScreen(context, const RoutinesScreen()),
            child: MainButton(
              foregroundColor: Colors.white,
              backgroundColor: mainThemeColour,
              borderColor: Colors.grey,
              text: 'Routines',
              boxWidth: mainButtonSize,
            ),
          ),
          GestureDetector(
            onTap: () => navToScreen(context, const ExercisesScreen()),
            child: MainButton(
              foregroundColor: Colors.white,
              backgroundColor: mainThemeColour,
              borderColor: Colors.grey,
              text: 'Exercises',
              boxWidth: mainButtonSize,
            ),
          ),
        ],
      )),
    );
  }
}

void navToScreen(
  BuildContext context,
  Widget screen,
) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: ((BuildContext context) => screen),
    ),
  );
}
