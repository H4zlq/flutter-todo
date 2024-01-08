import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contexts/theme_context.dart';

class ThemeProvider extends StatelessWidget {
  final Widget? child;

  const ThemeProvider({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeContext(), child: child);
  }
}
