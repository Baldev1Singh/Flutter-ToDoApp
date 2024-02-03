import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_cubit/models/todo_modal.dart';

import '../todo_filter_cubit/todo_filter_cubit.dart';
import '../todo_list_cubit/todo_list_cubit.dart';
import '../todo_search_cubit/todo_search_cubit.dart';

part 'filter_todo_state.dart';

class FilterTodoCubit extends Cubit<FilterTodoState> {
  List<TodoModel> initialTodoList;
  FilterTodoCubit({
    required this.initialTodoList,
  }) : super(FilterTodoState(filterTodoList: initialTodoList));
  void setFilteredTodo(Filter todoFilter,List<TodoModel> todoList,String searchTerm) {
    List<TodoModel> _filteredTodo;
    switch (todoFilter) {
      case Filter.active:
        _filteredTodo = todoList
            .where((TodoModel todoModel) => !todoModel.completed)
            .toList();
        break;
      case Filter.completed:
        _filteredTodo = todoList
            .where((TodoModel todoModel) => todoModel.completed)
            .toList();
        break;
      case Filter.all:
        _filteredTodo = todoList;
        break;
    }
    if (searchTerm.isNotEmpty) {
      _filteredTodo = _filteredTodo
          .where((TodoModel todoModel) =>
              todoModel.desc.toLowerCase().contains(searchTerm))
          .toList();
    }
    emit(state.copyWith(filterTodoList: _filteredTodo));
  }

}
