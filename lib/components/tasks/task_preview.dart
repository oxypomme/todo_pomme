import 'package:flutter/material.dart';
import 'package:todo_pomme/classes/task.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview({Key? key, required this.task, this.onItemClick})
      : super(key: key);

  final Task task;
  final Function()? onItemClick;

  @override
  _TaskPreviewState createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  void checkItem(bool? newValue) {
    setState(() {
      widget.task.completed = newValue ?? false;
    });
    widget.onItemClick!();
  }

  @override
  Widget build(BuildContext context) {
    const completedStyle =
        TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: widget.onItemClick,
      child: Row(
        children: <Widget>[
          Checkbox(value: widget.task.completed, onChanged: checkItem),
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
