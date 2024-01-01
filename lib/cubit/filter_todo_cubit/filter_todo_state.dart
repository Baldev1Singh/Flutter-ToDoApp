part of 'filter_todo_cubit.dart';

 class FilterTodoState extends Equatable {
  final List<TodoModel> filterTodoList;

  const FilterTodoState({
    required this.filterTodoList,
  });

  @override
  String toString() {
    return 'FilterTodoState{filterTodoList: $filterTodoList}';
  }

  FilterTodoState copyWith({
    List<TodoModel>? filterTodoList,
  }) {
    return FilterTodoState(
      filterTodoList: filterTodoList ?? this.filterTodoList,
    );
  }

  factory FilterTodoState.initial(){
    return const FilterTodoState(filterTodoList: []);
  }
  @override
  List<Object?> get props =>[filterTodoList];
}

