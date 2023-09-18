import 'package:flutter/material.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const Divider(
            height: 10,
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'Future Tasks Here',
                style: DefaultTextStyle.of(context).style,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
