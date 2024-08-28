import 'package:flutter/material.dart';
import 'package:gencheminkaist/providers/remote_config.dart';
import 'package:gencheminkaist/widgets/course_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_context/riverpod_context.dart';

class CourseListPage extends StatelessWidget {
  const CourseListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final courses =
        context.watch(coursesProvider).where((e) => e.isEnabled).toList();
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (builder, index) => Padding(
        padding: const EdgeInsets.all(8),
        child: CourseTile(
          course: courses[index],
          onTap: () => context.push('/courses/${courses[index].courseNo}'),
        ),
      ),
    );
  }
}
