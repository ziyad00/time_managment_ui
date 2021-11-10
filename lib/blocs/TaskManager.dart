import 'dart:async';

import 'package:time_managment_flutter/models/Task.dart';
import 'package:time_managment_flutter/services/tasks_services.dart';

class TaskManager {
  final StreamController<int> _taskCount = StreamController<int>();
  Stream<int> get taskCount => _taskCount.stream;
  Stream<dynamic> get TaskListView async* {
    yield await TaskService.get_all();
  }
  TaskManager() {
    TaskListView.listen((list) { _taskCount.add(list.length);});
  }


}