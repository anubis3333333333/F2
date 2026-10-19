import "package:f2/todo.dart";

void main(){
  Todo task1 = Todo(id : 1 , title: "чо сделать");
  Todo task2 = Todo(id : 2 , title: "что сделать");
  task1.complete();
  print(task1);
  print(task2);



}
