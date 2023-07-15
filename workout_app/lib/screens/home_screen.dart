import 'package:flutter/material.dart';
import 'package:workout_app/components/app_bar.dart';
import 'package:workout_app/components/main_button.dart';

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
          MainButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            borderColor: Colors.grey,
            text: 'Explore Routines',
            size: 250,
          ),
          MainButton(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blueGrey,
            borderColor: Colors.grey,
            icon: Icons.home,
            text: '',
            isIcon: true,
            size: 250,
          ),
        ],
      )),
    );
  }
}
