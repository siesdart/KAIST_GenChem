// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
      isEnabled: json['isEnabled'] as bool,
      courseTitle: json['courseTitle'] as String,
      courseNo: json['courseNo'] as String,
      syllabuses: Map<String, String>.from(json['syllabuses'] as Map),
      taContact: json['taContact'] as String,
      notice: json['notice'] as String,
      lectureNotes: (json['lectureNotes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      expProcedures: (json['expProcedures'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      practiceSchedules:
          (json['practiceSchedules'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      examInfo: json['examInfo'] as String?,
      pastPapers: json['pastPapers'] as String?,
      labSafety: json['labSafety'] as String?,
    );

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
      'isEnabled': instance.isEnabled,
      'courseTitle': instance.courseTitle,
      'courseNo': instance.courseNo,
      'syllabuses': instance.syllabuses,
      'lectureNotes': instance.lectureNotes,
      'expProcedures': instance.expProcedures,
      'taContact': instance.taContact,
      'practiceSchedules': instance.practiceSchedules,
      'examInfo': instance.examInfo,
      'notice': instance.notice,
      'pastPapers': instance.pastPapers,
      'labSafety': instance.labSafety,
    };
