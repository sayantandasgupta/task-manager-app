import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/providers/providers.dart';
import 'package:task_manager_app/widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    final dueTasksList =
        Provider.of<TasksProvider>(context, listen: false).dueTasksList;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Due Tasks',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: 32,
              ),
        ),
        centerTitle: true,
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemBuilder: (ctx, index) => TaskCard(
            title: dueTasksList[index].title,
            dueDate: dueTasksList[index].dueDate,
          ),
          itemCount: dueTasksList.length,
        ),
      ),
    );
  }
}
