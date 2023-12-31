part of 'todo_list_cubit.dart';

 class TodoListState extends Equatable{
   List<TodoModel> todoList;

   TodoListState({required this.todoList});
   
  factory TodoListState.initial(){
     return TodoListState(todoList: [
       TodoModel(id: '1',desc: 'Clean the room'),
       TodoModel(id: '1',desc: 'Wash the dish'),
       TodoModel(id: '1',desc: 'Do Homework'),
     ]);
   }
   
   @override
  String toString() {
    return 'TodoListState{todoList: $todoList}';
  }

   TodoListState copyWith({
    List<TodoModel>? todoList,
  }) {
    return TodoListState(
      todoList: todoList ?? this.todoList,
    );
  }

  @override
  List<Object?> get props =>[todoList];
}