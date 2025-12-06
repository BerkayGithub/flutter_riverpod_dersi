import 'package:flutter/material.dart';

class ToolbarWidget extends StatelessWidget {
  const ToolbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: const Text("4 görev var")),
        Tooltip(
          message: "All todos",
          child: TextButton(onPressed: (){},child: const Text("All")),
        ),
        Tooltip(
          message: "Only uncompleted todos",
          child: TextButton(onPressed: (){},child: const Text("Active")),
        ),
        Tooltip(
          message: "Only completed todos",
          child: TextButton(onPressed: (){},child: const Text("Completed")),
        ),
      ],
    );
  }
}
