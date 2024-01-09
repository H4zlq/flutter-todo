import 'package:flutter/material.dart';
import 'package:todo_app/app/shared/components/todo_app_bar.dart';

/* Application structures */

// Components
import '../shared/components/todo_list.dart';
import '../shared/components/todo_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

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
        appBar: const TodoAppBar(title: 'Todo Management'),
        body: const TodoList(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return const TodoDialog();
              },
            );
          },
          tooltip: 'Add Todo',
          child: const Icon(Icons.add),
        ));
  }
}
