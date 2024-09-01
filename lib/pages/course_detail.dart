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
              syllabus.key != '_' ? 'Syllabus (${syllabus.key})' : 'Syllabus',
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
            ...course.lectureNotes!.entries.map(
              (lectureNote) => _buildTile(
                context,
                const Icon(Icons.slideshow),
                lectureNote.key != '_'
                    ? 'Lecture Notes (${lectureNote.key})'
                    : 'Lecture Notes',
                lectureNote.value,
              ),
            ),
          if (course.expProcedures != null)
            ...course.expProcedures!.entries.map(
              (expProcedure) => _buildTile(
                context,
                const Icon(Icons.slideshow),
                expProcedure.key != '_'
                    ? 'Exp. Procedure (${expProcedure.key})'
                    : 'Exp. Procedure',
                expProcedure.value,
              ),
            ),
          if (course.practiceSchedules != null)
            ...course.practiceSchedules!.entries.map(
              (practiceClass) => _buildTile(
                context,
                const Icon(Icons.calendar_today),
                practiceClass.key != '_'
                    ? 'Practice Class (${practiceClass.key})'
                    : 'Practice Class',
                practiceClass.value,
              ),
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
