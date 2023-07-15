import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: "custom app bar",
        leading: Icon(
          Icons.home,
          color: Colors.red,
        ),
      ),
      body: Center(child: Text('Home screen')),
    );
  }
}
