import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_riverpod_dersi/todoApp/providers/todo_manager.dart';
import 'package:uuid/uuid.dart';

import '../models/todo.dart';

final todoListProvider = StateNotifierProvider<TodoManager, List<Todo>>((ref){
  return TodoManager([
    Todo(id: const Uuid().v4(), description: "Spora git"),
    Todo(id: const Uuid().v4(), description: "Alışveriş yap"),
    Todo(id: const Uuid().v4(), description: "Ders çalış"),
    Todo(id: const Uuid().v4(), description: "Bilgisayar oyna"),
  ]);
});

final uncompletedTodoCount = Provider<int>((ref){
  final allTodo = ref.watch(todoListProvider);
  final count = allTodo.where((element) => !element.isDone).length;
  return count;
});

final currentTodo = Provider<Todo>((ref){
  throw UnimplementedError();
});