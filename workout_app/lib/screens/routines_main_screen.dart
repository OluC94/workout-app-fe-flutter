import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';

class RoutinesScreen extends StatefulWidget {
  const RoutinesScreen({super.key});

  @override
  State<RoutinesScreen> createState() => _RoutinesScreenState();
}

class _RoutinesScreenState extends State<RoutinesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          title: "Routines",
        ),
      ),
    );
  }
}

// button --> alter dimensions (width as primary dimension, hieight == null ? hieght = width)
// Routine Card
// form field
