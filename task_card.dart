import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/task_model.dart';
import '../providers/task_provider.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final String currentStatus;

  const TaskCard({
    super.key,
    required this.task,
    required this.currentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        title: Text(task.title ?? ''),
        subtitle: Text(task.description ?? ''),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Delete') {
              context.read<TaskProvider>().deleteTask(task.sId!, currentStatus);
            } else {
              context
                  .read<TaskProvider>()
                  .updateStatus(task.sId!, currentStatus, value);
            }
          },
          itemBuilder: (context) => const [
            PopupMenuItem(value: 'New', child: Text('New')),
            PopupMenuItem(value: 'Progress', child: Text('Progress')),
            PopupMenuItem(value: 'Completed', child: Text('Completed')),
            PopupMenuItem(value: 'Cancelled', child: Text('Cancelled')),
            PopupMenuItem(value: 'Delete', child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
