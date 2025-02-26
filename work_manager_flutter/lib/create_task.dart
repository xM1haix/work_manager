import 'package:flutter/material.dart';

class CreateTask extends StatefulWidget {
  final int? teamId;
  const CreateTask(this.teamId, {super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create task"),
      ),
      body: Text("NOT IMPLEMENTED"),
    );
  }
}
