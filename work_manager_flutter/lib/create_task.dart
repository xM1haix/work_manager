import "package:flutter/material.dart";

class CreateTask extends StatefulWidget {
  const CreateTask(this.teamId, {super.key});
  final int? teamId;

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create task"),
      ),
      body: const Text("NOT IMPLEMENTED"),
    );
  }
}
