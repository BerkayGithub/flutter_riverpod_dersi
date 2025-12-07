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