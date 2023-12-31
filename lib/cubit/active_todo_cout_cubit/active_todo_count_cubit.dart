import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/models/todo_modal.dart';

import '../todo_list_cubit/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late StreamSubscription todoListStreamSubscription;
  TodoListCubit todoListCubit; // _ToDo List type variable

  ActiveTodoCountCubit({
    required this.todoListCubit,
  }) : super(ActiveTodoCountState.initial()) {
    todoListStreamSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print('todoListState $todoListState');

      final int currentActiveTodoCount = todoListState.todoList
          .where((TodoModel todoModel) => !todoModel.completed)
          .toList()
          .length;

      emit(state.copyWith(activeTodoCount: currentActiveTodoCount));

    });
  }
  @override
  Future<void> close() {
    todoListStreamSubscription.cancel();
    return super.close();
  }
}
