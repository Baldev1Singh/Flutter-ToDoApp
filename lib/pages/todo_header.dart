import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/active_todo_cout_cubit/active_todo_count_cubit.dart';
class ToDoHeader extends StatelessWidget {
  const ToDoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const  Text(
          'TODO',
          style: TextStyle(fontSize: 40),
        ),
        BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
            builder: (context, state) {
              return Text(
                ' ${state.activeTodoCount} items left',
                style: TextStyle(fontSize: 20,color: Colors.redAccent),
              );
            })
      ],
    );
  }
}
