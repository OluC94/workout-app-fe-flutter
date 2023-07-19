import 'package:http/http.dart' as http;
import 'dart:convert';
import 'models.dart';

String baseURL = 'https://oluc94.pythonanywhere.com';

Future<List<Exercise>> fetchExercises() async {
  final response = await http.get(Uri.parse('$baseURL/exercises'));

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
  final response = await http.get(Uri.parse('$baseURL/exercises/$exerciseId'));

  if (response.statusCode == 200) {
    return Exercise.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load exercise');
  }
}

Future fetchRoutines() async {
  try {
    http.Response response = await http.get(Uri.parse('$baseURL/routines'));
    if (response.statusCode == 200) {
      Map mapRes = json.decode(response.body);
      print(mapRes['routines']);
      return mapRes['routines'];
    }
  } catch (err) {
    print(err);
    return err;
  }
}

Future fetchRoutineById(int id) async {
  try {
    http.Response response = await http.get(Uri.parse('$baseURL/routines/$id'));

    Map mapRes = json.decode(response.body);
    if (response.statusCode == 200) {
      return mapRes;
    }
  } catch (err) {
    print(err);
    return err;
  }
}
