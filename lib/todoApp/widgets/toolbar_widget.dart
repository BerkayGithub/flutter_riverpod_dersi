import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_dersi/todoApp/providers/all_providers.dart';

class ToolbarWidget extends ConsumerWidget {
  ToolbarWidget({super.key});
  var _currentFilter = TodoListFilter.all;

  Color changeTextColor(TodoListFilter filter) {
    return filter == _currentFilter ? Colors.orange : Colors.black;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unConmpletedCount = ref.watch(uncompletedTodoCount);
    _currentFilter = ref.watch(filterProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: unConmpletedCount == 0
              ? Text("Tüm görevler tamamlandı")
              : Text("$unConmpletedCount görev var"),
        ),
        Tooltip(
          message: "All todos",
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: changeTextColor(TodoListFilter.all),
            ),
            onPressed: () {
              ref.read(filterProvider.notifier).state = TodoListFilter.all;
            },
            child: const Text("All"),
          ),
        ),
        Tooltip(
          message: "Only uncompleted todos",
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: changeTextColor(TodoListFilter.uncompleted),
            ),
            onPressed: () {
              ref.read(filterProvider.notifier).state =
                  TodoListFilter.uncompleted;
            },
            child: const Text("Active"),
          ),
        ),
        Tooltip(
          message: "Only completed todos",
          child: TextButton(
            style: TextButton.styleFrom(
              foregroundColor: changeTextColor(TodoListFilter.completed),
            ),
            onPressed: () {
              ref.read(filterProvider.notifier).state =
                  TodoListFilter.completed;
            },
            child: const Text("Completed"),
          ),
        ),
      ],
    );
  }
}
