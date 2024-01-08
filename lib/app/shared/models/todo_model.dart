import 'package:flutter/material.dart';

class Todo extends ChangeNotifier {
  int id;
  String title;
  bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "completed": completed,
      };
}
