class Todo {
  int id;
  String title;
  bool isDone;
  static int _counter = 0;
  
  Todo({required this.title})
    : id = ++_counter,
      isDone = false;
  @override 
  String toString(){
    String mark = isDone ? "[X]" : "[ ]";
    return "$mark $id. $title ($status)";

  }
  String get status => isDone ? "complete" : "in process";
  void complete(){
    isDone = true;
  }
}
