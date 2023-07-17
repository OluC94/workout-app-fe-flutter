class Exercise {
  final int exerciseId;
  final String exerciseName;
  final String muscle;
  final String equipment;
  final String instructions;

  const Exercise({
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
