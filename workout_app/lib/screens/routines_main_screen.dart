import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/custom_search_form.dart';
import 'package:workout_app/utils/stlye_variables.dart';

import '../components/main_button.dart';

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({super.key});

  @override
  State<RoutinesScreen> createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Routines",
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
                text: 'Create new routine',
                boxWidth: mainButtonSize,
                boxHeight: mainRectButtonHeight,
              ),
            ),
            const CustomSearchForm(),
            Container(
              height: 300,
              width: 300,
              padding: EdgeInsets.all(25),
              margin: EdgeInsets.all(25),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: const [Text("Placeholder 1"), Text('Placeholder 2')],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void searchFunction() {}

// Routine Card
// form field - how to group? 
