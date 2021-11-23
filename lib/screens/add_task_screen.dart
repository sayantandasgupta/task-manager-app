import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/providers/providers.dart';

import '../utils/utils.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  static const routeName = '/add-task';

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _addTask() {
    if (_titleController.text.isEmpty) {
      return;
    }

    print('Add task Button pressed');

    Provider.of<TasksProvider>(context, listen: false).addTask(
        _titleController.text,
        '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}');

    Navigator.of(context).pop();
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );
    print(selected);

    if (selected != null && selected != _selectedDate) {
      setState(() {
        _selectedDate = selected;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Task',
            style:
                Theme.of(context).textTheme.headline2!.copyWith(fontSize: 24)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                focusColor: white,
                label: const Text('Title'),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _selectDate(context);
              },
              child: const Text('Select Due Date'),
            ),
            Text(
                'Due Date: ${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}'),
            const Spacer(),
            ElevatedButton(
              onPressed: _addTask,
              child: Text(
                'Add Task',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
