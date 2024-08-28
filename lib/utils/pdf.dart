import 'package:html_to_pdf_plus/html_to_pdf_plus.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

Future<void> openPdf(String title, String htmlContent) async {
  final directory = await getTemporaryDirectory();
  final file = await HtmlToPdf.convertFromHtmlContent(
    htmlContent: htmlContent,
    configuration: PdfConfiguration(
      targetDirectory: directory.path,
      targetName: title,
    ),
  );
  await OpenFilex.open(file.path);
}
