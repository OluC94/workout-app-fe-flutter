import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Workout App",
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: const Center(child: Text('Home screen')),
    );
  }
}
