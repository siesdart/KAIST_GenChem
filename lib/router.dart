import 'package:flutter/material.dart';
import 'package:gencheminkaist/home.dart';
import 'package:gencheminkaist/pages/app.dart';
import 'package:gencheminkaist/pages/course_detail.dart';
import 'package:gencheminkaist/pages/course_list.dart';
import 'package:gencheminkaist/pages/more.dart';
import 'package:gencheminkaist/pages/notice.dart';
import 'package:gencheminkaist/pages/webview.dart';
import 'package:gencheminkaist/providers/remote_config.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_context/riverpod_context.dart';

final router = GoRouter(
  initialLocation: '/courses',
  routes: [
    ShellRoute(
      builder: (context, state, child) => GenChemHome(body: child),
      routes: [
        GoRoute(
          path: '/courses',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: CourseListPage()),
        ),
        GoRoute(
          path: '/notice',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: NoticePage()),
        ),
        GoRoute(
          path: '/more',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MorePage()),
        ),
      ],
    ),
    GoRoute(
      path: '/courses/:courseNo',
      builder: (context, state) {
        final course = context.read(coursesProvider).firstWhere(
              (course) => course.courseNo == state.pathParameters['courseNo'],
            );
        return CourseDetailPage(course: course);
      },
    ),
    GoRoute(
      path: '/webview/:title',
      builder: (context, state) => WebViewPage(
        title: state.pathParameters['title']!,
        url: Uri.parse(state.extra!.toString()),
      ),
    ),
    GoRoute(
      path: '/app',
      builder: (context, state) => const AppPage(),
    ),
    GoRoute(
      path: '/license',
      builder: (context, state) => const LicensePage(),
    ),
  ],
);
