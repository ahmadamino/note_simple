import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';

class TaskDetailsPage extends StatelessWidget {
  const TaskDetailsPage({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          task.title,
          style: Theme.of(context).textTheme.headline6,        ),
      ),
      body: Column(
        children: [
          Container(
              child: Text(task.description,
        style: Theme.of(context).textTheme.headline5,       )) ],
      ),
    );
  }
}
