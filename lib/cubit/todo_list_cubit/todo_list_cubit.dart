import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_modal.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addToDO(String todoDesc) {
    final newToDO = TodoModel(desc: todoDesc);
    // add new _toDo in _todo list
    final newToDos = [...state.todoList, newToDO];
    emit(state.copyWith(todoList: newToDos));
  }

  void editToDo({required String id, required String desc}) {
    // traverse the _todo list using .map() function
    final newTodos = state.todoList.map((TodoModel todo) {
      //compare the id's of existing _todo list if id exists
      // then add changes to "newTodos" variable
      if (todo.id == id) {
        return TodoModel(id: id, desc: desc, completed: todo.completed);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todoList: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todoList.map((TodoModel todo) {
      if (todo.id == id) {
        return TodoModel(
          id: id,
          desc: todo.desc,
          completed: !todo.completed,
        );
      }
      return todo;
    }).toList();

    emit(state.copyWith(todoList: newTodos));
  }

  void removeToDO(TodoModel todo) {
    final newTodos = state.todoList.where((TodoModel todoModel) {
      return todoModel.id != todo.id;
    }).toList();
    emit(state.copyWith(todoList: newTodos));
  }
}
