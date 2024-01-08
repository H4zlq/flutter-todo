import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Application structures */

// Contexts
import '../../contexts/todo_context.dart';

// Models
import '../models/todo_model.dart';

class TodoDialog extends StatelessWidget {
  const TodoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var todoProvider = Provider.of<TodoContext>(context);
    var todos = todoProvider.todos;
    var titleController = TextEditingController();

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Add Todo'),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Title'),
                  focusedBorder: OutlineInputBorder(),
                  floatingLabelStyle: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    todoProvider.addTodo(
                      Todo(
                        id: todos.length + 1,
                        title: titleController.text,
                        completed: false,
                      ),
                    );
                  },
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
