import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contexts/todo_context.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoContext>(context);
    final todos = provider.todos;

    if (todos.isEmpty) {
      return handleEmptyList(context);
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        var todo = todos[index];

        return Dismissible(
          key: Key(todo.id.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            provider.deleteTodoById(todo.id);
          },
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content:
                      const Text("Are you sure you wish to delete this item?"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("DELETE")),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("CANCEL"),
                    ),
                  ],
                );
              },
            );
          },
          background: Container(color: Colors.red),
          child: Card(
            child: ListTile(
              leading: Checkbox(
                value: todo.completed,
                onChanged: (value) {
                  todo.completed = value!;
                  provider.toggleCompleted(todo);
                },
              ),
              title: todo.completed
                  ? Text(
                      todo.title,
                      style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  : Text(
                      todo.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }

  Widget handleEmptyList(BuildContext context) {
    final provider = Provider.of<TodoContext>(context);
    final todos = provider.todos;

    if (todos.isEmpty) {
      return const Center(
        child: Text('No todos found.'),
      );
    }

    return const SizedBox.shrink();
  }
}
