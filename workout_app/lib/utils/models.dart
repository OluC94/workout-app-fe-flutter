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


/* 


{
"ExerciseId": 1,
"ExerciseName": "Incline Hammer Curls",
"Muscle": "biceps",
"Equipment": "dumbbell",
"Instructions": string


 */