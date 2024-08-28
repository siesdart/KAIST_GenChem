import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gencheminkaist/models/course.dart';

final remoteConfigProvider =
    Provider<FirebaseRemoteConfig>((ref) => throw UnimplementedError());

final genchemUrlProvider = Provider<String>((ref) {
  final remoteConfig = ref.watch(remoteConfigProvider);
  return remoteConfig.getString('genchem_url');
});

final noticeUrlProvider = Provider<String>((ref) {
  final remoteConfig = ref.watch(remoteConfigProvider);
  return remoteConfig.getString('notice_url');
});

final coursesProvider = Provider<List<Course>>((ref) {
  final remoteConfig = ref.watch(remoteConfigProvider);
  return (jsonDecode(remoteConfig.getString('courses')) as List)
      .map((e) => Course.fromJson(e as Map<String, dynamic>))
      .toList();
});
