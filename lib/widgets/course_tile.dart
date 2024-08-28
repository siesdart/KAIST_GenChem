import 'package:flutter/material.dart';
import 'package:gencheminkaist/models/course.dart';
import 'package:gencheminkaist/theme.dart';

class CourseTile extends StatelessWidget {
  const CourseTile({required this.course, this.onTap, super.key});

  final Course course;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.white,
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(color: GenChemTheme.primaryColor, width: 2),
            ),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                course.courseNo,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                course.courseTitle,
                style: theme.textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
