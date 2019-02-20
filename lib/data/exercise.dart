class Exercise{
  String name,definition;
  List steps;

  Exercise({this.name,this.definition,this.steps});
}

class DetailedExerciseData{
  Exercise exercise;
  int reps;
  int duration;
  String sides;

  DetailedExerciseData.withReps(this.exercise,this.reps);
  DetailedExerciseData.withRepsAndDuration(this.exercise,this.reps,this.duration);
  DetailedExerciseData.withDuration(this.exercise,this.duration);
  DetailedExerciseData.withSidesAndDuration(this.exercise,this.duration,this.sides);
  DetailedExerciseData.withAll(this.exercise,this.reps,this.sides,this.duration);
}