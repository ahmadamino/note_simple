import "package:flutter/material.dart";
import "package:simple_todo_app/models/task.dart";


class TaskProvider with ChangeNotifier{
  final  List<Task> _tasks=[];

  List<Task> get tasks =>_tasks;

  void addTask(Task task){
    _tasks.add(task);
    notifyListeners();
  }
  void remove(Task task){
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task ){
    task.doneChange();
    notifyListeners();
  }
}