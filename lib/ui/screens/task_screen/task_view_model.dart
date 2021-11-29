import 'package:flutter/material.dart';
import 'package:task_list/data/data_task.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:task_list/services/task_service.dart';

class TaskViewModel extends ChangeNotifier {
  final _taskService = TaskService();
  final _nameTaskTextController = TextEditingController();
  String _nameText = '';
  bool _isAddTask = false;
  var _tasks = <Task>[];

  bool get isAddTask => _isAddTask;
  List<Task> get reversedTasks => _tasks.reversed.toList();
  TextEditingController? get nameTaskTextController => _nameTaskTextController;

  TaskViewModel() {
    _loadTasks();
    _listener();
  }

  Future<void> _loadTasks() async {
    _tasks = await _taskService.loadTsaks();
    notifyListeners();
  }

  void onChangedCheckBox(bool? value, int index) {
    if (value == null) return;
    final indexReversedElement = _tasks.length - index - 1;
    _taskService.changeState(indexReversedElement);
    notifyListeners();
  }

  void onPressAddButton() {
    _isAddTask = true;
    notifyListeners();
  }

  void _listener() {
    _nameTaskTextController.addListener(() {
      _nameText = _nameTaskTextController.text;
    });
    KeyboardVisibilityController().onChange.listen((bool visible) {
      if (visible == false) onSubmitted();
    });
  }

  Future<void> onSubmitted() async {
    if (_nameText != '') {
      _taskService.addTask(_nameText);
      await _loadTasks();
    }
    _nameTaskTextController.clear();
    _isAddTask = false;
    notifyListeners();
  }
}
