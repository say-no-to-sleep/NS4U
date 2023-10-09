import 'package:flutter/material.dart';

class Task {
  final String title;
  final bool isComplete;

  Task(this.title, this.isComplete);
}

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskWidget(task: tasks[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tasks.add(Task('New Task', false));
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class TaskWidget extends StatefulWidget {
  final Task task;

  const TaskWidget({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.title),
      leading: Checkbox(
        value: isComplete,
        onChanged: (value) {
          setState(() {
            isComplete = value!;
          });
        },
      ),
    );
  }
}
