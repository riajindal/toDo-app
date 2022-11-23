import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasksList = [
    Task(title: "Buy milk", isChecked: false),
    Task(title: "Buy eggs", isChecked: false),
    Task(title: "Buy bread", isChecked: false),
  ];

  UnmodifiableListView<Task> get tasksList {
    return UnmodifiableListView(_tasksList);
  }

  int get taskCount {
    return _tasksList.length;
  }

  void addTask(Task newTask) {
    _tasksList.add(newTask);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasksList.remove(task);
    notifyListeners();
  }
}
