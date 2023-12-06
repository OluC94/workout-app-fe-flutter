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
}
