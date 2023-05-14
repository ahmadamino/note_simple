
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo_app/models/change.dart';
import 'package:simple_todo_app/themeModel.dart';
import 'package:simple_todo_app/ui/add_task/add_task_page.dart';
import 'package:simple_todo_app/ui/task_details/task_details_page.dart';

import '../../models/task.dart';

class HomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context){
    final provider=context.read<TaskProvider>();
    final themeProvider =context.read<ThemeModal>();

    return  Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Center(
          child: const Text(
            'مذكرات ومذكرات',
            style: TextStyle(
                fontSize: 25,
                color: Colors.red,
                fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.format_list_bulleted),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],

      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('AbdulQader'),
                accountEmail: Text('abdulQader@gmail.com')),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'تغير الموود',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: 10,
                ),
                Switch(
                    value: themeProvider.isDark ? true : false,
                    onChanged: (value) {
                      themeProvider.isDark
                          ? themeProvider.isDark = false
                          : themeProvider.isDark = true;
                    }),
              ],
            ),
          ],
        ),
      ),
      body:

      Consumer<TaskProvider>(
        builder: (context, value, child) {
          if(value.tasks.isEmpty) {
            return Center(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'لا يوجد اي ملاحظة انقر + للاضافة',
                    style: TextStyle(fontSize: 30, color: Colors.teal),
                  ),
                  SizedBox(height: 10),
                  Image.asset(
                    'images/docments.png',
                    height: 350,
                    color: Colors.teal,
                  ),
                ],
              ),
            ),
          );
          }else return Column(
            children: [
              Text(
                'All To Dos',
                style: TextStyle(fontSize: 40),
              ),
              Divider(),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      final task = value.tasks[index];
                      return InkWell(
                        onTap: () {
                          _openTaskDetailsPage(context,task);
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius:
                              BorderRadius.circular(15)),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        task.title,
                                        overflow:
                                        TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ),
                                    PopupMenuButton(
                                        onSelected: (value) {
                                          if (value == 'edit') {
                                            _openAddTaskPage(context);
                                          } else if (value == 'delete') {}
                                        }, itemBuilder: (context) {
                                      return [
                                        PopupMenuItem(
                                          child: Text('Edit'),
                                          value: 'edit',
                                        ),
                                        PopupMenuItem(
                                          child: Text('delete'),
                                          value: 'delete',
                                        ),
                                      ];
                                    })
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: task.isCompleted,
                                      onChanged: (value) {
                                       provider.updateTask(task);
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(25),
                                      ),
                                    ),
                                    Text(
                                      task.description,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.blue,
                                        decoration: task.isCompleted
                                            ? TextDecoration
                                            .lineThrough
                                            : TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) =>
                                            AlertDialog(
                                              title: const Text(
                                                  'تنبيه'),
                                              content: Text(
                                                  'هل تريد حذف العنصر'),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(
                                                        context)
                                                        .pop();
                                                  },
                                                  child: Text(
                                                      'cancel'),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    provider.remove(
                                                        task);
                                                    Navigator.of(
                                                        context)
                                                        .pop();
                                                  },
                                                  child:
                                                  Text('ok'),
                                                ),
                                              ],
                                            ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: value.tasks.length,
                  ),

                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed:()=> _openAddTaskPage(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );

  }

  void _openAddTaskPage(BuildContext context) async {
    final provider=context.read<TaskProvider>();

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const AddTaskPage(),
      ),
    );
    if (result != null) {
    provider.addTask(result as Task);

  }
  }

  void _openTaskDetailsPage(BuildContext context, Task task) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => TaskDetailsPage(
          task: task,
        ),
      ),
    );
  }

  // _changeTaskStatus(Task task, bool value) {
  //   setState(() {
  //     task.isCompleted = value;
  //   });
  // }
}
