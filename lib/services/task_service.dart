import 'package:hive/hive.dart';
import 'package:task_list/data/data_task.dart';

class TaskService {
  Future<List<Task>> loadTsaks() async {
    var box = await Hive.openBox<Task>('taskBox');
    final tasks = box.values.toList();
    return tasks;
  }

  Future<void> addTask(String nameTask) async {
    var box = await Hive.openBox<Task>('taskBox');
    final task = Task(name: nameTask, isDone: false);
    box.add(task);
  }

  Future<void> changeState(int index) async {
    var box = await Hive.openBox<Task>('taskBox');
    final task = box.getAt(index);
    task?.isDone = !task.isDone;
    await task?.save();
  }
}
