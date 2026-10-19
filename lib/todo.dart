class Todo {
  int id;
  String title;
  bool isDone;

  
  Todo({required this.id, required this.title , this.isDone = false});
  @override 
  String toString(){
    String status = isDone ? "[X]" : "[ ]";
    return "$status $id. $title";

  }
  void complete(){
    isDone = true;
  }
}
