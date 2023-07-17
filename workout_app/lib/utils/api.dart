import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models.dart';

String baseURL = 'https://oluc94.pythonanywhere.com';

Future<http.Response> fetchExercises() {
  return http.get(Uri.parse('$baseURL/exercises'));
}

Future<Exercise> fetchExerciseByID() async {
  final response = await http.get(Uri.parse('$baseURL/exercises/1'));

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
