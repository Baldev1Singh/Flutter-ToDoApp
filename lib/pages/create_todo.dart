import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/cubits.dart';

class CreateToDo extends StatefulWidget {
  const CreateToDo({super.key});

  @override
  State<CreateToDo> createState() => _CreateToDoState();
}

class _CreateToDoState extends State<CreateToDo> {
  TextEditingController newToDoController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    newToDoController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: newToDoController,
      decoration:const  InputDecoration(
        labelText: 'What to do?',
      ),
      onSubmitted: (String? todoDesc) {
        if(todoDesc != null && todoDesc.trim().isNotEmpty){
          context.read<TodoListCubit>().addToDO(todoDesc);
        }
      },
    );
  }
}
