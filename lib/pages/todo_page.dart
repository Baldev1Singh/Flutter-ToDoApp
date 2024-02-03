import 'package:flutter/material.dart';
import 'package:todo_cubit/pages/create_todo.dart';
import 'package:todo_cubit/pages/search_and_filter_todo.dart';
import 'package:todo_cubit/pages/show_todo.dart';
import 'package:todo_cubit/pages/todo_header.dart';

class TODOPage extends StatefulWidget {
  const TODOPage({super.key});

  @override
  State<TODOPage> createState() => _TODOPageState();
}

class _TODOPageState extends State<TODOPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Column(
          children: [
            const ToDoHeader(),
            const CreateToDo(),
            const SizedBox(
              height: 20,
            ),
            SearchAndFilterToDo(),
            const ShowTodo(),

          ],
        ),
      ),
    );
  }
}

