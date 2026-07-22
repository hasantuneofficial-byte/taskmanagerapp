import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class TaskCountByStatus extends StatelessWidget {
  final Map<String, int> statusCount;

  const TaskCountByStatus({super.key, required this.statusCount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          _countBox('New', statusCount['New'] ?? 0, AppColors.newTaskColor),
          _countBox(
              'Progress', statusCount['Progress'] ?? 0, AppColors.progressColor),
          _countBox('Completed', statusCount['Completed'] ?? 0,
              AppColors.completedColor),
          _countBox('Cancelled', statusCount['Cancelled'] ?? 0,
              AppColors.cancelledColor),
        ],
      ),
    );
  }

  Widget _countBox(String label, int count, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Text('$count',
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 12, color: color)),
          ],
        ),
      ),
    );
  }
}
