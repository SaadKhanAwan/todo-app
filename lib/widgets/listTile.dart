import 'package:flutter/material.dart';
import 'package:todoey_app/widgets/model.dart';

class MyListTile extends StatelessWidget {
  final Task task;
  final void Function(bool?) onChanged;
  final void Function() onlongpress;

  const MyListTile({
    super.key,
    required this.task,
    required this.onChanged,
    required this.onlongpress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onlongpress,
      leading: Text(
        maxLines: null,
        task.name,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          decoration: task.isdone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: task.isdone,
        onChanged: onChanged,
      ),
    );
  }
}
