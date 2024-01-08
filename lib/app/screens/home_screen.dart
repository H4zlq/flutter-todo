import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Application structures */

// Components
import '../shared/components/todo_list.dart';

// Contexts
import '../contexts/theme_context.dart';
import '../contexts/todo_context.dart';

/* Core structures */

// Models
import '../shared/models/todo_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget todoDialog(BuildContext context) {
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

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var themeProvider = Provider.of<ThemeContext>(context);

    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                ),
                child: const Text('Todo Management'),
              ),
              ListTile(
                title: const Text('Lists'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
            title: const Text('Todos'),
            backgroundColor: Theme.of(context).colorScheme.primary,
            actions: [
              IconButton(
                onPressed: themeProvider.toggleTheme,
                icon: themeProvider.isDark
                    ? const Icon(
                        Icons.brightness_7,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.brightness_4,
                        color: Colors.black,
                      ),
              ),
            ]),
        body: const TodoList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: todoDialog,
            );
          },
          tooltip: 'Add Todo',
          child: const Icon(Icons.add),
        ));
  }
}
