typedef NoticeList = ({List<Notice> genchem, List<Notice> genchemLab});

class Notice {
  Notice({required this.title, required this.date});

  final String title;
  final String date;
}
