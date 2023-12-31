part of 'todo_search_cubit.dart';

 class TodoSearchState extends Equatable {

   final String todo;

   const TodoSearchState({required this.todo});

   factory TodoSearchState.initial(){
     return const TodoSearchState(todo: '');
   }

   @override
  String toString() {
    return 'TodoSearchState{todo: $todo}';
  }
   List<Object> get props => [todo];

   TodoSearchState copyWith({
    String? todo,
  }) {
    return TodoSearchState(
      todo: todo ?? this.todo,
    );
  }
}

