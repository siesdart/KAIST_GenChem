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
    this.expProcedure,
    this.practiceSchedule,
    this.examInfo,
    this.pastPapers,
    this.labSafety,
  });

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);

  final bool isEnabled;
  final String courseTitle;
  final String courseNo;
  final Map<String, String> syllabuses;
  final String? lectureNotes;
  final String? expProcedure;
  final String taContact;
  final String? practiceSchedule;
  final String? examInfo;
  final String notice;
  final String? pastPapers;
  final String? labSafety;

  Map<String, dynamic> toJson() => _$CourseToJson(this);
}
