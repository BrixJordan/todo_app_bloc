

import 'package:todo_app_bloc/domains/models/todo.dart';

abstract class TodoRepo {
  //get list
  Future<List<Todo>> getTodos();

  //add
  Future<void> addTodo(Todo newTodo);

  //update
  Future<void> updateTodo(Todo todo);

  //delete
  Future<void> deleteTodo(Todo todo);
}