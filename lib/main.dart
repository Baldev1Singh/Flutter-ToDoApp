import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/cubits.dart';
import 'package:todo_cubit/pages/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider(
          create: (context) => ActiveTodoCountCubit(
            initialActiveTodoCount: context.read<TodoListCubit>().state.todoList.length,),
        ),
        BlocProvider(
          create: (context) => FilterTodoCubit(
            initialTodoList:context.read<TodoListCubit>().state.todoList,
        ),
        ),
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TODOPage(),
      ),
    );
  }
}
