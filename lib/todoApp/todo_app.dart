import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_dersi/todoApp/providers/all_providers.dart';
import 'package:flutter_riverpod_dersi/todoApp/widgets/title_widget.dart';
import 'package:flutter_riverpod_dersi/todoApp/widgets/todo_list_item_widget.dart';
import 'package:flutter_riverpod_dersi/todoApp/widgets/toolbar_widget.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});
  final newTodoController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todoList = ref.watch(todoListProvider);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: <Widget>[
          TitleWidget(),
          TextField(
            decoration: InputDecoration(labelText: "Bugün ne yapacaksın?"),
            onSubmitted: (newTodo){
              ref.read(todoListProvider.notifier).addTodo(newTodo);
            },
          ),
          const SizedBox(height: 20),
          ToolbarWidget(),
          for(var i = 0; i < todoList.length; i++)
            Dismissible(
                key: ValueKey(todoList[i].id),
                onDismissed: (_){
                  ref.read(todoListProvider.notifier).delete(todoList[i]);
                },
                child: TodoListItemWidget(todoItem:todoList[i])),
        ],
      ),
    );
  }
}
