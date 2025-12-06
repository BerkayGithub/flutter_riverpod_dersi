import 'package:flutter/material.dart';

import '../models/todo.dart';

class TodoListItemWidget extends StatelessWidget {
  final Todo todoItem;
  const TodoListItemWidget({super.key, required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: true,
        onChanged: (newValue) {
          debugPrint(newValue.toString());
        },
      ),
      title: Text(todoItem.description),
    );
  }
}
