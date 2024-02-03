import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/cubits.dart';
import 'package:todo_cubit/models/todo_modal.dart';

import '../cubit/active_todo_cout_cubit/active_todo_count_cubit.dart';

class ToDoHeader extends StatelessWidget {
  const ToDoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'TODO',
          style: TextStyle(fontSize: 40),
        ),
        BlocListener<TodoListCubit, TodoListState>(
          listener: (context, state) {
            int activeTodoCount = state.todoList
                .where((TodoModel todo) => !todo.completed)
                .toList()
                .length;
            context.read<ActiveTodoCountCubit>().changeActiveToDOCount(activeTodoCount);
          },
          child: BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
              builder: (context, state) {
            return Text(
              ' ${state.activeTodoCount} items left',
              style: TextStyle(fontSize: 20, color: Colors.redAccent),
            );
          }),
        )
      ],
    );
  }
}
