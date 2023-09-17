import 'package:trilhaapp/model/task.dart';

class TaskRepository {
  final List<Task> _tasks = [];

  Future<void> addTask(Task task) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.add(task);
  }

  Future<void> updateTask(String id, bool isDone) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.where((task) => task.id == id).first.isDone = isDone;
  }

  Future<void> removeTask(String id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    _tasks.remove(_tasks.where((task) => task.id == id).first);
  }

  Future<List<Task>> getTasks() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks;
  }

  Future<List<Task>> getNoDoneTasks() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _tasks.where((task) => !task.isDone).toList();
  }
}
