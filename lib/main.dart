import 'dart:io';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app_bloc/data/models/isar_todo.dart';
import 'package:todo_app_bloc/data/repository/isar_todo_repo.dart';
import 'package:todo_app_bloc/domains/repository/todo_repo.dart';
import 'package:todo_app_bloc/presentation/todo_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get application cache directory
  final dir = await getApplicationCacheDirectory();

  // Open the Isar database
  final isar = await Isar.open([TodoIsarSchema], directory: dir.path);

  // Initialize the repository after Isar is ready
  // ignore: unused_local_variable
  final isarTodoRepo = IsarTodoRepo(isar);

  // Run the app
  runApp(MyApp(
    todoRepo: isarTodoRepo,
  ));
}

class MyApp extends StatelessWidget {
  final TodoRepo todoRepo;

  const MyApp({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
    );
  }
}
