import 'package:flutter/material.dart';
import 'package:todo_pomme/classes/task.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  _TaskPreviewState createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  void onItemClick() {
    setState(() {
      widget.task.completed = !widget.task.completed;
    });
  }

  @override
  Widget build(BuildContext context) {
    const completedStyle =
        TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onItemClick,
      child: Row(
        children: <Widget>[
          Checkbox(
              value: widget.task.completed,
              onChanged: (newValue) => onItemClick()),
          Expanded(
              child: Text(
            widget.task.content,
            style: widget.task.completed ? completedStyle : null,
          ))
        ],
      ),
    );
  }
}
