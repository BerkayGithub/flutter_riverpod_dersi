import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_dersi/todoApp/providers/all_providers.dart';

class ToolbarWidget extends ConsumerWidget {
  const ToolbarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unConmpletedCount = ref.watch(uncompletedTodoCount);
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
          child: TextButton(onPressed: () {}, child: const Text("All")),
        ),
        Tooltip(
          message: "Only uncompleted todos",
          child: TextButton(onPressed: () {}, child: const Text("Active")),
        ),
        Tooltip(
          message: "Only completed todos",
          child: TextButton(onPressed: () {}, child: const Text("Completed")),
        ),
      ],
    );
  }
}
