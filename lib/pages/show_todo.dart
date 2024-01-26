import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/cubits.dart';

import '../models/todo_modal.dart';

class ShowTodo extends StatelessWidget {
  const ShowTodo({super.key});

  @override
  Widget build(BuildContext context) {
    List<TodoModel> todo =
        context.watch<FilterTodoCubit>().state.filterTodoList;
    return ListView.separated(
      primary: true,
      shrinkWrap: true,
      itemCount: todo.length,
      separatorBuilder: (context, index) => const Divider(color: Colors.grey),
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(todo[index].id),
        onDismissed: (_) {
          context.read<TodoListCubit>().removeToDO(todo[index]);
        },
        confirmDismiss: (_) {
          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you really want to delete?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text('NO'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text('YES'),
                  ),
                ],
              );
            },
          );
        },
        child: TodoItem(
          todoItem: todo[index],
        ),
        background: showBackground(0),
        secondaryBackground: showBackground(1),
      ),
    );
  }

  Widget showBackground(int direction) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: const Icon(size: 20.0, color: Colors.white, Icons.delete),
    );
  }
}

class TodoItem extends StatefulWidget {
  TodoItem({super.key, required this.todoItem});
  TodoModel todoItem;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  late TextEditingController textController;
  @override
  void initState() {
    textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            bool _error = false;
            textController.text = widget.todoItem.desc;
            return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: Text('Edit Todo'),
                  content: TextField(
                    controller: textController,
                    autofocus: true,
                    decoration: InputDecoration(
                      errorText: _error ? 'Value can not be empty' : null,
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Cancel'),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _error = textController.text.isEmpty ? true : false;
                          });

                          if (!_error) {
                            context.read<TodoListCubit>().editToDo(
                                id: widget.todoItem.id,
                                desc: textController.text);
                            Navigator.pop(context);
                          }
                        },
                        child: Text('Edit'))
                  ],
                );
              },
            );
          },
        );
      },
      leading: Checkbox(
        value: widget.todoItem.completed,
        onChanged: (bool? checked) {
          context.read<TodoListCubit>().toggleTodo(widget.todoItem.id);
        },
      ),
      title: Text(
        widget.todoItem.desc,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
