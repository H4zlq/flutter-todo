import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Application structures */

// Components
import '../shared/components/todo_list.dart';
import '../shared/components/todo_dialog.dart';

// Contexts
import '../contexts/theme_context.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
