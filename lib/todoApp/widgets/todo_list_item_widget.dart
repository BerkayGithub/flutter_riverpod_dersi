import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_dersi/todoApp/providers/all_providers.dart';

class TodoListItemWidget extends ConsumerStatefulWidget {
  const TodoListItemWidget({super.key});

  @override
  ConsumerState<TodoListItemWidget> createState() => _TodoListItemWidgetState();
}

class _TodoListItemWidgetState extends ConsumerState<TodoListItemWidget> {
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTodoItem = ref.read(currentTodo);
    return Focus(
      onFocusChange: (isFocused){
        if(!isFocused){
          setState(() {
            hasFocus = false;
          });
          ref.read(todoListProvider.notifier).edit(currentTodoItem.id, textEditingController.text);
        }else{
          textEditingController.text = currentTodoItem.description;
        }
      },
      child: ListTile(
        onTap: (){
          setState(() {
            hasFocus = true;
          });
          focusNode.requestFocus();
        },
        leading: Checkbox(
          value: currentTodoItem.isDone,
          onChanged: (newValue) {
            ref.read(todoListProvider.notifier).toggle(currentTodoItem);
          },
        ),
        title: hasFocus ? TextField(
          controller: textEditingController,
          focusNode: focusNode,
        ) : Text(currentTodoItem.description),
      ),
    );
  }
}