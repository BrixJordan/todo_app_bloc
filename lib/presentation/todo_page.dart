import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/domains/repository/todo_repo.dart';
import 'package:todo_app_bloc/presentation/todo_cubit.dart';
import 'package:todo_app_bloc/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {

  final TodoRepo todoRepo;

  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=> TodoCubit(todoRepo,),
    child: const TodoView(),);
  }
}