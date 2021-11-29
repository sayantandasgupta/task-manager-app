import 'package:flutter/widgets.dart';

import '../models/models.dart';
import '../database/db_helper.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _dueTasks = [];

  List<Task> get dueTasksList {
    return [..._dueTasks];
  }

  void addTask(String title, String dueDate) {
    final newTask = Task(
      id: DateTime.now().toString(),
      title: title,
      dueDate: dueDate,
    );
    _dueTasks.add(newTask);
    notifyListeners();
    DBHelper.insert({
      'id': newTask.id,
      'title': title,
      'dueDate': dueDate,
    });
  }

  void deleteTask(String id) {
    _dueTasks.removeWhere((element) => element.id == id);
    notifyListeners();
    DBHelper.delete(id);
  }

  Future<void> fetchAndSetTasks() async {
    final dataList = await DBHelper.fetch();

    _dueTasks = dataList
        .map(
          (item) => Task(
            id: item['id'],
            title: item['title'],
            dueDate: item['dueDate'],
          ),
        )
        .toList();
    notifyListeners();
  }
}
