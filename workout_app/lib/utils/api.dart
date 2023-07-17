import 'package:http/http.dart' as http;
import 'dart:convert';

String baseURL = 'https://oluc94.pythonanywhere.com';

Future<http.Response> fetchRoutineDetail() {
  return http.get(Uri.parse('https://oluc94.pythonanywhere.com/routines/1'));
}

class Album {
  final int routineId;
  final String routineName;
  final List routineDays;

  const Album(
      {required this.routineId,
      required this.routineName,
      required this.routineDays});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        routineId: json['RoutineId'],
        routineName: json['RoutineName'],
        routineDays: json['RoutineDays']);
  }
}

Future fetchRoutines() async {
  http.Response response = await http.get(Uri.parse('$baseURL/routines'));

  if (response.statusCode == 200) {
    Map mapRes = json.decode(response.body);
    print(mapRes['routines']);
    return mapRes['routines'];
  }
}

Future fetchRoutineById(int id) async {
  http.Response response = await http.get(Uri.parse('$baseURL/routines/$id'));

  Map mapRes = json.decode(response.body);
  if (response.statusCode == 200) {
    return mapRes;
  }
}
