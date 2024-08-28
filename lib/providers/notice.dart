import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gencheminkaist/http.dart';
import 'package:gencheminkaist/models/notice.dart';
import 'package:gencheminkaist/providers/remote_config.dart';
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart';

final noticesProvider = FutureProvider.autoDispose((ref) async {
  final cancelToken = CancelToken();

  ref.onDispose(cancelToken.cancel);

  final response = await dio.get<String>(
    ref.read(noticeUrlProvider),
    cancelToken: cancelToken,
  );
  final document = parse(response.data);

  List<Notice>? genchem;
  List<Notice>? genchemLab;

  document.querySelectorAll('tr').forEach((e) {
    var title = e
        .querySelectorAll('*')
        .where((e) => e.firstChild is dom.Text)
        .map(
          (e) =>
              e.firstChild.toString().replaceAll('"', '').replaceAll('\n', ''),
        )
        .join()
        .trim();

    if (title.endsWith('more')) {
      title = title.substring(0, title.length - 4).trimRight();
    }

    while (title.endsWith('.')) {
      title = title.substring(0, title.length - 1).trimRight();
    }

    while (title.contains('  ')) {
      title = title.replaceAll('  ', ' ');
    }

    if (title.isEmpty) {
      if (genchem != null) {
        if (genchem!.isNotEmpty) genchemLab = [];
      } else {
        genchem = [];
      }
    } else if (title != '•') {
      title = title.replaceAll('•', '').trimLeft();

      final titleIndex = title.indexOf('[CH');
      final date = title.substring(0, titleIndex).trimRight();
      final notice = Notice(
        title: title.substring(titleIndex),
        date: date.substring(1, date.length - 1),
      );

      if (genchemLab != null) {
        genchemLab!.add(notice);
      } else {
        genchem!.add(notice);
      }
    }
  });

  return (genchem: genchem!, genchemLab: genchemLab!);
});
