import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/shared/components/todo_app_bar.dart';

/* Application structures */

// Contexts
import '../contexts/theme_context.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppBar(title: 'Settings'),
      body: Consumer<ThemeContext>(
        builder: (context, provider, child) {
          return ListView(
            children: [
              ListTile(
                title: const Text('Dark Mode'),
                trailing: Switch(
                  value: provider.theme == ThemeMode.dark,
                  onChanged: (_) {
                    provider.toggleTheme();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
