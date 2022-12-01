import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../task_data.dart';
import 'task_tile.dart';
import '../models/task.dart';

class TasksList extends StatefulWidget {
  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  Widget deleteTaskAlert(Task task) {
    print("Reached here");
    return AlertDialog(
      title: Text("Are you sure you would like to delete the task?"),
      actions: [
        TextButton(
            onPressed: () {
              Provider.of<TaskData>(context).deleteTask(task);
            },
            child: Text("Yes")),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("No"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasksList[index];
            return TaskTile(
              title: task.title,
              isChecked: task.isChecked,
              checkboxCallback: (bool checkboxState) {
                if (checkboxState != null) {
                  taskData.updateTask(task);
                }
              },
              longPressCallback: () {
                print("Reached here");
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                        "Are you sure you would like to delete the expense?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Provider.of<TaskData>(context, listen: false)
                                .deleteTask(task);
                            Navigator.of(context).pop();
                          },
                          child: Text("Yes")),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("No"),
                      )
                    ],
                  ),
                );
              },
            );
          },
          itemCount: Provider.of<TaskData>(context).taskCount,
        );
      },
    );
  }
}
