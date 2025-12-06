import 'package:flutter_riverpod/legacy.dart';
import 'package:uuid/uuid.dart';

import '../models/todo.dart';

class TodoManager extends StateNotifier<List<Todo>> {
  TodoManager(List<Todo>? initialTodos) : super(initialTodos ?? []);

  void addTodo(String todoDescription) {
    final newTodo = Todo(id: Uuid().v4(), description: todoDescription);
    state = [...state, newTodo];
  }

  void toggle(Todo todo) {
    state = [
      for (var todoItem in state)
        if (todoItem.id == todo.id)
          Todo(id: todo.id, description: todo.description, isDone: !todo.isDone)
        else
          todo,
    ];
  }

  void edit(String todoId, String newDescription){
    state = [
      for (var todoItem in state)
        if (todoItem.id == todoId)
          Todo(id: todoItem.id, description: newDescription, isDone: todoItem.isDone)
        else
          todoItem,
    ];
  }

  void delete(Todo todo){
    state = state.where((element) => element.id != todo.id).toList();
    //By making a new state with a list of todos that is not equal to the to be deleted todo's id, it is like we delete it
  }
}
