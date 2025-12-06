import 'package:flutter/material.dart';
import 'package:flutter_riverpod_dersi/todoApp/models/todo.dart';
import 'package:flutter_riverpod_dersi/todoApp/widgets/title_widget.dart';
import 'package:flutter_riverpod_dersi/todoApp/widgets/todo_list_item_widget.dart';
import 'package:flutter_riverpod_dersi/todoApp/widgets/toolbar_widget.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends StatelessWidget {
  TodoApp({super.key});
  final newTodoController = TextEditingController();
  final List<Todo> todoList = [
    Todo(id : Uuid().v4(), description: "Spora git"),
    Todo(id : Uuid().v4(), description: "Alışveriş yap"),
    Todo(id : Uuid().v4(), description: "Ders çalış")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        children: <Widget>[
          TitleWidget(),
          TextField(
            decoration: InputDecoration(labelText: "Bugün ne yapacaksın?"),
            onSubmitted: (newTodo){
              debugPrint("$newTodo eklendi");
            },
          ),
          const SizedBox(height: 20),
          ToolbarWidget(),
          for(var i = 0; i < todoList.length; i++)
            Dismissible(
                key: ValueKey(todoList[i].id),
                onDismissed: (_){

                },
                child: TodoListItemWidget(todoItem:todoList[i])),
        ],
      ),
    );
  }
}
