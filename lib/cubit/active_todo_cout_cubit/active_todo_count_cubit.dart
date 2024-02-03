import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/models/todo_modal.dart';

import '../todo_list_cubit/todo_list_cubit.dart';

part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  int initialActiveTodoCount;
  ActiveTodoCountCubit({
    required this.initialActiveTodoCount,
  }) : super(ActiveTodoCountState(activeTodoCount: initialActiveTodoCount));

  void changeActiveToDOCount(int activeToDoCount){
    emit(state.copyWith(activeTodoCount: activeToDoCount));
  }
}
