import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_dersi/todoApp/providers/all_providers.dart';

import '../models/todo.dart';

class TodoListItemWidget extends ConsumerStatefulWidget {
  final Todo todoItem;
  const TodoListItemWidget({super.key, required this.todoItem});

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
    return Focus(
      onFocusChange: (isFocused){
        if(!isFocused){
          setState(() {
            hasFocus = false;
          });
          ref.read(todoListProvider.notifier).edit(widget.todoItem.id, textEditingController.text);
        }else{
          textEditingController.text = widget.todoItem.description;
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
          value: widget.todoItem.isDone,
          onChanged: (newValue) {
            ref.read(todoListProvider.notifier).toggle(widget.todoItem);
          },
        ),
        title: hasFocus ? TextField(
          controller: textEditingController,
          focusNode: focusNode,
        ) : Text(widget.todoItem.description),
      ),
    );
  }
}