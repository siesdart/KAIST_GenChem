import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';

@JsonSerializable()
class Course {
  Course({
    required this.isEnabled,
    required this.courseTitle,
    required this.courseNo,
    required this.syllabuses,
    required this.taContact,
    required this.notice,
    this.lectureNotes,
    this.expProcedures,
    this.practiceSchedules,
    this.examInfo,
    this.pastPapers,
    this.labSafety,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  final bool isEnabled;
  final String courseTitle;
  final String courseNo;
  final Map<String, String> syllabuses;
  final Map<String, String>? lectureNotes;
  final Map<String, String>? expProcedures;
  final String taContact;
  final Map<String, String>? practiceSchedules;
  final String? examInfo;
  final String notice;
  final String? pastPapers;
  final String? labSafety;

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
