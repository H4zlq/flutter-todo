import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* Application structures */

// Screens
import 'app/screens/home_screen.dart';
import 'app/screens/settings_screen.dart';

// Themes
import 'app/shared/themes/app_theme.dart';

// Contexts
import 'app/contexts/theme_context.dart';

// Providers
import 'app/providers/theme_provider.dart';
import 'app/providers/todo_provider.dart';

void main() {
  runApp(
    const ThemeProvider(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeContext>(context);

    return TodoProvider(
      child: MaterialApp(
        title: 'Todo App',
        debugShowCheckedModeBanner: false,

        // Theme
        themeMode: themeProvider.theme,
        theme: lightTheme,
        darkTheme: darkTheme,

        // Routes
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/settings': (context) => const SettingsScreen(),
        },
      ),
    );
  }
}
