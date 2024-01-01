import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/models/todo_modal.dart';

import '../todo_filter_cubit/todo_filter_cubit.dart';
import '../todo_list_cubit/todo_list_cubit.dart';
import '../todo_search_cubit/todo_search_cubit.dart';

part 'filter_todo_state.dart';

class FilterTodoCubit extends Cubit<FilterTodoState> {
  late StreamSubscription todoListSubscription;
  late StreamSubscription toDoSearchSubscription;
  late StreamSubscription todoFilterSubscription;
  final TodoListCubit todoListCubit;
  final TodoSearchCubit toDoSearchCubit;
  final TodoFilterCubit todoFilterCubit;
  FilterTodoCubit({
    required this.todoListCubit,
    required this.toDoSearchCubit,
    required this.todoFilterCubit,
  }) : super(FilterTodoState.initial()) {
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
          setFilteredTodo();
        });

    toDoSearchSubscription =
        toDoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
          setFilteredTodo();
        });

    todoListSubscription = todoListCubit.stream.listen((event) {
      setFilteredTodo();
    });
  }
  void setFilteredTodo() {
    List<TodoModel> _filteredTodo;
    switch (todoFilterCubit.state.todoFilter) {
      case Filter.active:
        _filteredTodo = todoListCubit.state.todoList
            .where((TodoModel todoModel) => !todoModel.completed)
            .toList();
        break;
      case Filter.completed:
        _filteredTodo = todoListCubit.state.todoList
            .where((TodoModel todoModel) => todoModel.completed)
            .toList();
        break;
      case Filter.all:
        _filteredTodo = todoListCubit.state.todoList;
        break;
    }
    if (toDoSearchCubit.state.todo.isNotEmpty) {
      _filteredTodo = _filteredTodo
          .where((TodoModel todoModel) =>
              todoModel.desc.toLowerCase().contains(toDoSearchCubit.state.todo))
          .toList();
    }
    emit(state.copyWith(filterTodoList: _filteredTodo));
  }
  @override
  Future<void> close() {
    todoListSubscription.cancel();
    toDoSearchSubscription.cancel();
    todoFilterSubscription.cancel();
    return super.close();
  }
}
