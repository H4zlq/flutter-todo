import 'package:flutter/material.dart';

import '../shared/models/todo_model.dart';

class TodoContext extends ChangeNotifier {
  List<Todo> todos = [];

  TodoContext() {
    fetchTodos();
  }

  void fetchTodos() {
    todos = [
      Todo(
        id: 1,
        title: 'Buy milk',
        completed: false,
      ),
      Todo(
        id: 2,
        title: 'Buy eggs',
        completed: false,
      ),
      Todo(
        id: 3,
        title: 'Buy bread',
        completed: false,
      ),
      Todo(
        id: 4,
        title: 'Buy butter',
        completed: false,
      ),
      Todo(
        id: 5,
        title: 'Buy cheese',
        completed: false,
      ),
    ];

    notifyListeners();
  }

  void toggleCompleted(Todo target) {
    for (var todo in todos) {
      if (todo.id == target.id) {
        todo.completed = target.completed;
        notifyListeners(); // Notify listeners to rebuild UI
        break;
      }
    }
  }

  bool isEmpty() {
    return todos.isEmpty;
  }

  void addTodo(Todo todo) {
    if (todo.title.isEmpty) {
      return;
    }

    todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  void deleteTodoById(int id) {
    todos.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
