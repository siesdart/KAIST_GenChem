import 'package:flutter/material.dart';
import 'package:gencheminkaist/models/course.dart';
import 'package:gencheminkaist/widgets/activity_tile.dart';
import 'package:go_router/go_router.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({required this.course, super.key});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          _buildTile(
            context,
            const Icon(Icons.volume_up),
            'Notice',
            course.notice,
          ),
          if (course.examInfo != null)
            _buildTile(
              context,
              const Icon(Icons.volume_up),
              'Exam Info',
              course.examInfo!,
            ),
          ...course.syllabuses.entries.map(
            (syllabus) => _buildTile(
              context,
              const Icon(Icons.file_open),
              course.syllabuses.length > 1
                  ? 'Syllabus (${syllabus.key})'
                  : 'Syllabus',
              syllabus.value,
            ),
          ),
          _buildTile(
            context,
            const Icon(Icons.mail),
            'TA Contact',
            course.taContact,
          ),
          if (course.lectureNotes != null)
            _buildTile(
              context,
              const Icon(Icons.slideshow),
              'Lecture Notes',
              course.lectureNotes!,
            ),
          if (course.expProcedure != null)
            _buildTile(
              context,
              const Icon(Icons.slideshow),
              'Exp. Procedure',
              course.expProcedure!,
            ),
          if (course.practiceSchedule != null)
            _buildTile(
              context,
              const Icon(Icons.calendar_today),
              'Practice Class',
              course.practiceSchedule!,
            ),
          if (course.pastPapers != null)
            _buildTile(
              context,
              const Icon(Icons.menu_book),
              'Past Papers',
              course.pastPapers!,
            ),
          if (course.labSafety != null)
            _buildTile(
              context,
              const Icon(Icons.science),
              'Lab Safety',
              course.labSafety!,
            ),
        ],
      ),
    );
  }

  Widget _buildTile(
    BuildContext context,
    Widget leading,
    String title,
    String url,
  ) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: ActivityTile(
        leading: leading,
        title: Text(title),
        onTap: () => context.push('/webview/$title', extra: url),
      ),
    );
  }
}
