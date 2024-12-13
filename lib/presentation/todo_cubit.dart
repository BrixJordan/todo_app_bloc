import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_bloc/domains/models/todo.dart';
import 'package:todo_app_bloc/domains/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  //reference todo repo
  final TodoRepo todoRepo;

  //construct
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  //load
  Future<void> loadTodos() async {
    final todoList = await todoRepo.getTodos();

    emit(todoList);
  }

  //add
  Future<void> addTodo(String text) async {
    final newTodo = Todo(id: DateTime.now().millisecondsSinceEpoch, text: text);

    await todoRepo.addTodo(newTodo);

    loadTodos();
  }

  //delete

  Future<void> deleteTodo(Todo todo) async {
    await todoRepo.deleteTodo(todo);

    loadTodos();
  }

  //toggle
  Future<void> toggleCompletion(Todo todo) async {
    final updateTodo = todo.toggleCompletion();

    await todoRepo.updateTodo(updateTodo);

    loadTodos();
  }
}
