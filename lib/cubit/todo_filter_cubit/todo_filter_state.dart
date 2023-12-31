part of 'todo_filter_cubit.dart';

 class TodoFilterState extends Equatable {
  const TodoFilterState({required this.todoFilter});
   final Filter todoFilter;

   factory TodoFilterState.initial(){
     // Then, Filter.all would represent the option to show all items without
     // any specific filtering, essentially indicating that no filter is applied
     return const TodoFilterState(todoFilter: Filter.all);
   }
   @override
   List<Object> get props => [todoFilter];

   @override
  String toString() {
    return 'TodoFilterState{todoFilter: $todoFilter}';
  }

   TodoFilterState copyWith({
    Filter? todoFilter,
  }) {
    return TodoFilterState(
      todoFilter: todoFilter ?? this.todoFilter,
    );
  }

 }
