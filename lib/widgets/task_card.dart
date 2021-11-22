import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String dueDate;

  const TaskCard({
    Key? key,
    required this.title,
    required this.dueDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: Text(title),
          trailing: Text('Due Date: $dueDate'),
        ),
      ),
    );
  }
}
