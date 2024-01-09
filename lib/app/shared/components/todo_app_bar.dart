import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../contexts/theme_context.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TodoAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeContext>(context);

    return AppBar(
        title: Text(title),
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
        ]);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);
}
