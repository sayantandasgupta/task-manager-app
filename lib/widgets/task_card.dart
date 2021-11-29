import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import '../providers/providers.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(task.title),
          subtitle: Text('Due Date: ${task.dueDate}'),
          trailing: IconButton(
            onPressed: () {
              //TODO: Add the function to delete the task
              Provider.of<TasksProvider>(context, listen: false)
                  .deleteTask(task.id);
            },
            icon: Icon(Icons.delete, color: Colors.red),
          ),
        ),
      ),
    );
  }
}
