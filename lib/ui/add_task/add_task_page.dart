import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.green[100],
      appBar: AppBar(
        // backgroundColor: Colors.grey[200],
        iconTheme: IconThemeData(color: Colors.indigo),
        title: const Text(
          'Add Task',
          style: TextStyle(
              fontSize: 30, color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: formstate,
        // autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'Task Title',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15),),
                      ),
                      validator: (value) {
                        if (value!.length < 4) {
                          return 'لايمكن ان يكون النص اقل من اربع احرف';
                        }
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Task Description',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(15),),
                      ),
                      validator: (val) {
                        if (val!.length < 4) {
                          return 'لايمكن ان يكون النص اقل من اربع احرف';
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (formstate.currentState!.validate()) {
                    Navigator.of(context).pop(
                      Task(
                        title: _titleController.text,
                        description: _descriptionController.text,
                      ),
                    );
                  } else {
                    return null;
                  }
                },
                child: const Text('Save',style: TextStyle(fontSize: 25),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
