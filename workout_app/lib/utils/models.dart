class Exercise {
  int exerciseId;
  String exerciseName;
  String muscle;
  String equipment;
  String instructions;

  Exercise({
    required this.exerciseId,
    required this.exerciseName,
    required this.muscle,
    required this.equipment,
    required this.instructions,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
        exerciseId: json['ExerciseId'],
        exerciseName: json['ExerciseName'],
        muscle: json['Muscle'],
        equipment: json['Equipment'],
        instructions: json['Instructions']);
  }

  Map<String, dynamic> toJson() {
    return {
      'ExerciseId': exerciseId,
      'ExerciseName': exerciseName,
      'Muscle': muscle,
      'Equipment': equipment,
      'Instructions': instructions,
    };
  }
}

class ExerciseList {
  final List<Exercise> exercises;

  const ExerciseList({required this.exercises});

  factory ExerciseList.fromJson(Map<String, dynamic> json) {
    return ExerciseList(exercises: json['exercises']);
  }
}

class Day {
  final int dayId;
  final String dayName;
  final List<Exercise> dayExercises;

  const Day(
      {required this.dayId, required this.dayName, required this.dayExercises});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
        dayId: json['DayId'],
        dayName: json['DayName'],
        dayExercises: json['DayExercises']);
  }

  Map<String, dynamic> toJson() {
    return {'DayId': dayId, 'DayName': dayName, 'DayExercises': dayExercises};
  }
}

class DayList {
  final List<Day> days;

  const DayList({required this.days});

  factory DayList.fromJson(Map<String, dynamic> json) {
    return DayList(days: json['days']);
  }
}

class Routine {
  final int routineId;
  final String routineName;
  final List routineDays;

  const Routine(
      {required this.routineId,
      required this.routineName,
      required this.routineDays});

  factory Routine.fromJson(Map<String, dynamic> json) {
    return Routine(
        routineId: json['RoutineId'],
        routineName: json['RoutineName'],
        routineDays: json['RoutineDays']);
  }

  Map<String, dynamic> toJson() {
    return {
      'RoutineId': routineId,
      'RoutineName': routineName,
      'RoutineDays': routineDays
    };
  }
}

class RoutineList {
  final List<Routine> routines;

  const RoutineList({required this.routines});

  factory RoutineList.fromJson(Map<String, dynamic> json) {
    return RoutineList(routines: json['routines']);
  }
}
