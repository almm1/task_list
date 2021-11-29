import 'package:hive/hive.dart';

class Task extends HiveObject {
  String name;
  bool isDone;

  Task({
    required this.name,
    required this.isDone,
  });
}

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final name = reader.readString();
    final isDone = reader.readBool();
    return Task(name: name, isDone: isDone);
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer.writeString(obj.name);
    writer.writeBool(obj.isDone);
  }
}
