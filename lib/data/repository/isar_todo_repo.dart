import 'package:isar/isar.dart';
import 'package:todo_app_bloc/data/models/isar_todo.dart';
import 'package:todo_app_bloc/domains/models/todo.dart';
import 'package:todo_app_bloc/domains/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  //database
  final Isar db;

  IsarTodoRepo(this.db);

  //get todos
  @override
  Future<List<Todo>> getTodos() async {
    //fetch from db

    final todos = await db.todoIsars.where().findAll();

    return todos.map((TodoIsar) => TodoIsar.toDomain()).toList();
  }

  //add todo
  @override
  Future<void> addTodo(Todo newTodo) async {
    // TODO: implement addTodo
    //convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(newTodo);
    //store it in isar db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  //update todo
  @override
  Future<void> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    //convert todo into isar todo
    final todoIsar = TodoIsar.fromDomain(todo);
    //store it in isar db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  //delete todo
  @override
  Future<void> deleteTodo(Todo todo) async {
    // TODO: implement deleteTodo
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}
