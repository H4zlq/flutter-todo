import 'package:flutter/material.dart';

import 'todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: TodoItem());
  }
}
