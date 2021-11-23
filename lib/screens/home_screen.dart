import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager_app/providers/providers.dart';
import 'package:task_manager_app/utils/utils.dart';
import 'package:task_manager_app/widgets/task_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
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
      body: FutureBuilder(
        future: Provider.of<TasksProvider>(context, listen: false)
            .fetchAndSetTasks(),
        builder: (context, AsyncSnapshot<void> snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(
                      color: white,
                    ),
                  )
                : Consumer<TasksProvider>(
                    child: Center(
                      child: Text(
                        'Add your tasks here!',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: white, fontSize: 30),
                      ),
                    ),
                    builder: (ctx, dueTasks, ch) =>
                        dueTasks.dueTasksList.isEmpty
                            ? ch!
                            : Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: ListView.builder(
                                  itemBuilder: (ctx, index) {
                                    final dueTasksList = dueTasks.dueTasksList;
                                    return TaskCard(
                                      title: dueTasksList[index].title,
                                      dueDate: dueTasksList[index].dueDate,
                                    );
                                  },
                                  itemCount: dueTasks.dueTasksList.length,
                                ),
                              ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //TODO Navigate to the add task page
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
