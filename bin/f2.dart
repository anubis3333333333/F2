import "package:f2/todo.dart";
import "dart:io";
import "package:ansicolor/ansicolor.dart";
void main(){

  final AnsiPen greenPen = AnsiPen()..green();
  final AnsiPen redPen = AnsiPen()..red();
  final AnsiPen bluePen = AnsiPen()..blue();
  final AnsiPen yellowPen = AnsiPen()..yellow();

  List<Todo> todos = [];
  printMenu();

  while (true){
    stdout.write("> ");
    String? input = stdin.readLineSync();
    if (input == null) continue;
    String command = input.trim().toLowerCase();
    if (command.isEmpty) continue;
    switch (command){
      case "add": addTodo(todos); break;
      case "list": listTodos(todos); break;
      case "done": completeTodo(todos); break;
      case "delete": deleteTodo(todos); break;
      case "exit": print("bye"); return;  
      default: printMenu(); print("command not found");


    }

  }
  



}

void printMenu(){
  print("");
  print("todo list");
  print("add");
  print("list");
  print("done");
  print("delete");
  print("exit");
}
void addTodo(List<Todo> todos){
  stdout.write("name of task:");
  String? input = stdin.readLineSync();

  if (input == null || input.trim().isEmpty){
    print("error:name don't null");
    return;
  }
  todos.add(Todo(title:input.trim()));
  print("task added");
}
void listTodos(List<Todo> todos){
  if (todos.isEmpty){
    print("task list is empty");
  }
  print("");
  for (var todo in todos){
    print(todo);

  }
}
 void completeTodo(List<Todo> todos){
  stdout.write("id of task:");
  String? input = stdin.readLineSync();

  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null){
    print("error: input digital");
    return;


  }
  for (var todo in todos){
    if (todo.id == id){
      todo.complete();
      print("task complete");
      return;
    }
  }
  print("task with id $id not found");
 }

 void deleteTodo(List<Todo> todos){
  stdout.write("id of task:");
  String? input = stdin.readLineSync();

  if (input == null) return;

  int? id = int.tryParse(input.trim());
  if (id == null){
    print("error:input digital");
    return;
  }
  for (int i = 0 ; i < todos.length; i++){
    if (todos[i].id == id) {
      todos.removeAt(i);
      print("task delete");

    }
  }
  print(yellowPen(("task with id $id not found")));
 }
