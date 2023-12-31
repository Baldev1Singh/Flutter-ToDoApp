import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter{
  all,
  completed,
  active,
}

Uuid uuid =const Uuid();

class TodoModel extends Equatable {
  final String id;
  final String desc;
  final bool completed;

  TodoModel({
    String? id,
    required this.desc,
     this.completed =  false,
  }) : this.id = id ?? uuid.v4();// if id is null then add new one

  @override
  List<Object> get props => [id,desc,completed];

  @override
  String toString() {
    return 'TodoModel{id: $id, desc: $desc ,completed: $completed}';
  }
}
