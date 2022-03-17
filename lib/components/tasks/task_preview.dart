import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../classes/task.dart';
import '../../data/tasks_collection.dart';

class TaskPreview extends StatefulWidget {
  const TaskPreview({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  _TaskPreviewState createState() => _TaskPreviewState();
}

class _TaskPreviewState extends State<TaskPreview> {
  late final TaskCollection _provider;

  void checkItem(bool? newValue) async {
    widget.task.completed = newValue ?? false;
    await _provider.update(widget.task);
  }

  void onItemClick(BuildContext context) {
    _provider.currentTask = widget.task;
  }

  @override
  void initState() {
    _provider = Provider.of<TaskCollection>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const completedStyle =
        TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey);

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onItemClick(context),
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
