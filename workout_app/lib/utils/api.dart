// import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:workout_app/utils/secrets.dart';
import 'dart:convert';
import 'models.dart';

String backendBaseURL = 'https://oluc94.pythonanywhere.com';
String ninjaBaseURL =
    'https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises';
var rapidApiHeaders = {
  'X-RapidAPI-Key': rapidApiKey,
  'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
};

Future<List<Exercise>> fetchExercises(
    [String name = '', String muscle = '', String equipment = '']) async {
  final params = {
    'ExerciseName': name,
    'Muscle': muscle,
    'Equipment': equipment
  };

  if (name.isEmpty) {
    params.remove('ExerciseName');
  }
  if (muscle.isEmpty) {
    params.remove('Muscle');
  }
  if (equipment.isEmpty) {
    params.remove('Equipment');
  }

  final response = await http.get(
      Uri.parse('$backendBaseURL/exercises').replace(queryParameters: params));

  if (response.statusCode == 200) {
    var jsonRes = jsonDecode(response.body);

    List<Exercise> exercises = [];
    for (var e in jsonRes['exercises']) {
      Exercise exercise = Exercise(
          exerciseId: e['ExerciseId'],
          exerciseName: e['ExerciseName'],
          muscle: e['Muscle'],
          equipment: e['Equipment'],
          instructions: e['Instructions']);
      exercises.add(exercise);
    }

    return exercises;
  } else {
    throw Exception('Failed to load exercises');
  }
}

Future<Exercise> fetchExerciseById(int exerciseId) async {
  final response =
      await http.get(Uri.parse('$backendBaseURL/exercises/$exerciseId'));

  if (response.statusCode == 200) {
    return Exercise.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load exercise');
  }
}

Future<List> fetchNinjaExercises([String name = '', String muscle = '']) async {
  final response = await http.get(
      Uri.https('exercises-by-api-ninjas.p.rapidapi.com', '/v1/exercises',
          {'name': name, 'muscle': muscle}),
      headers: rapidApiHeaders);

  if (response.statusCode == 200) {
    final parsedBody = json.decode(response.body);
    return parsedBody;
  } else {
    throw Exception('Failed to load exercises (API-ninja)');
  }
}

// posts return the created item
Future<Exercise> addExercise(Exercise newExercise) async {
  // Backend works correctly even if an exercise ID is sent in the POST request

  final response = await http.post(Uri.parse('$backendBaseURL/exercises/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newExercise));

  if (response.statusCode == 201) {
    return Exercise.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to add Exercise - ${response.statusCode}');
  }
}

Future<List<Routine>> fetchRoutines() async {
  final response = await http.get(Uri.parse('$backendBaseURL/routines'));

  if (response.statusCode == 200) {
    var jsonRes = jsonDecode(response.body);

    List<Routine> routines = [];
    for (var e in jsonRes['routines']) {
      Routine routine = Routine(
          routineId: e['RoutineId'],
          routineName: e['RoutineName'],
          routineDays: e['RoutineDays']);
      routines.add(routine);
    }

    return routines;
  } else {
    throw Exception('Failed to load routines');
  }
}

Future<Routine> fetchRoutineById(int routineId) async {
  final response =
      await http.get(Uri.parse('$backendBaseURL/routines/$routineId'));

  if (response.statusCode == 200) {
    return Routine.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load routine');
  }
}
