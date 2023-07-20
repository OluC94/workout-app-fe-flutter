import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models.dart';

String backendBaseURL = 'https://oluc94.pythonanywhere.com';
String ninjaBaseURL =
    'https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises';
var rapidApiHeaders = {
  'X-RapidAPI-Key': 'c4495d1c89msh7eb27d50709f331p15cfd0jsnab660d900088',
  'X-RapidAPI-Host': 'exercises-by-api-ninjas.p.rapidapi.com'
};

var params = {
  'name': '',
  'muscle': '',
};

Future<List<Exercise>> fetchExercises() async {
  final response = await http.get(Uri.parse('$backendBaseURL/exercises'));

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

Future<void> fetchNinjaExercises() async {
  final response =
      await http.get(Uri.parse(ninjaBaseURL), headers: rapidApiHeaders);

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    throw Exception('Failed to load exercises (API-ninja)');
  }
}
