import 'package:flutter/widgets.dart';

import '../models/models.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _dueTasks = [
    Task(id: DateTime.now().toString(), title: 'Test', dueDate: '2021-11-21')
  ];

  List<Task> get dueTasksList {
    return [..._dueTasks];
  }
}
