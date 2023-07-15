import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/main_button.dart';
import 'package:workout_app/screens/routines_main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

double mainButtonSize = 275;
Color mainThemeColour = const Color.fromARGB(255, 35, 119, 160);

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
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((BuildContext context) => const RoutinesScreen()),
                ),
              );
            },
            child: MainButton(
              foregroundColor: Colors.white,
              backgroundColor: mainThemeColour,
              borderColor: Colors.grey,
              text: 'Routines',
              size: mainButtonSize,
            ),
          ),
          GestureDetector(
            onTap: () {
              print("pressed");
            },
            child: MainButton(
              foregroundColor: Colors.white,
              backgroundColor: mainThemeColour,
              borderColor: Colors.grey,
              text: 'Exercises',
              size: mainButtonSize,
            ),
          ),
        ],
      )),
    );
  }
}
