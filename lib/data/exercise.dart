class Exercise{
  String name,definition,sides;
  List<dynamic> steps;
  int duration,reps;

  Exercise({this.name,this.definition=null,this.steps=null,this.sides=null,this.duration=null,this.reps});

  @override
  String toString() {
    return "$name $duration $sides $reps";
  }
}