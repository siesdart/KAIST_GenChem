import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gencheminkaist/models/notice.dart';
import 'package:gencheminkaist/providers/notice.dart';
import 'package:gencheminkaist/providers/remote_config.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_context/riverpod_context.dart';

class NoticePage extends StatelessWidget {
  const NoticePage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => context.refresh(noticesProvider.future),
      child: switch (context.watch(noticesProvider)) {
        AsyncData(value: final notices) => ListView(
            children: [
              _buildTitle(context, 'General Chemistry'),
              ..._buildNotices(context, notices.genchem),
              _buildTitle(context, 'General Chemistry Laboratory'),
              ..._buildNotices(context, notices.genchemLab),
            ],
          ),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }

  Widget _buildTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  Iterable<Widget> _buildNotices(BuildContext context, List<Notice> notices) {
    return ListTile.divideTiles(
      context: context,
      tiles: notices.map(
        (notice) => ListTile(
          title: Text(notice.title),
          subtitle: Text(notice.date),
          onTap: () {
            final course = context
                .read(coursesProvider)
                .firstWhere((course) => notice.title.contains(course.courseNo));
            context.push('/webview/${notice.title}', extra: course.notice);
          },
        ),
      ),
    );
  }
}
