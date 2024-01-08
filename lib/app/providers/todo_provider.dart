import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../contexts/todo_context.dart';

class TodoProvider extends StatelessWidget {
  final Widget? child;

  const TodoProvider({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => TodoContext(), child: child);
  }
}
