import 'package:flutter/widgets.dart';

import '../models/models.dart';

class TasksProvider with ChangeNotifier {
  List<Task> _dueTasks = [];

  List<Task> get dueTasksList {
    return [..._dueTasks];
  }
}
