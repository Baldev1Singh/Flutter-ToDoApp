import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_cubit/cubit/cubits.dart';
import 'package:todo_cubit/utils/debounce.dart';

import '../models/todo_modal.dart';

class SearchAndFilterToDo extends StatelessWidget {
   SearchAndFilterToDo({super.key});
  final debounce = Debounce(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Search todos...',
            border: InputBorder.none,
            filled: true,
            prefix: Icon(Icons.search),
          ),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
            debounce.run(() {
              context.read<TodoSearchCubit>().setSearchTerm(newSearchTerm);
            });
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.active),
            filterButton(context,Filter.completed),
          ],
        ),
      ],
    );
  }

  filterButton(BuildContext context, Filter filter) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(filter == Filter.all
          ? 'All'
          : Filter.active == filter
              ? 'Active'
              : 'Completed',
      style: TextStyle(fontSize: 18,color: textColor(context, filter),),
      ),
    );
  }
  Color textColor(BuildContext context,Filter filter){
    final currentFilter = context.watch<TodoFilterCubit>().state.todoFilter;
    return currentFilter == filter ?Colors.blue :Colors.grey;
  }
}
