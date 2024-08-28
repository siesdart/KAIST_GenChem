import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gencheminkaist/http.dart';
import 'package:gencheminkaist/utils/pdf.dart';
import 'package:pdfrx/pdfrx.dart';
import 'package:url_launcher/url_launcher.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({required this.title, required this.url, super.key});

  final String title;
  final Uri url;

  Future<void> _openAsPdf() async {
    final response = await dio.getUri<String>(url);
    if (response.data == null) return;
    await openPdf(title, response.data!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          if (!url.path.endsWith('.pdf'))
            IconButton(
              icon: const Icon(Icons.file_download),
              onPressed: _openAsPdf,
            ),
          IconButton(
            icon: const Icon(Icons.open_in_browser),
            onPressed: () => launchUrl(url),
          ),
        ],
      ),
      body:
          url.path.endsWith('.pdf') ? PdfViewer.uri(url) : _buildInAppWebView(),
    );
  }

  InAppWebView _buildInAppWebView() {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: url),
      initialOptions: InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          cacheEnabled: false,
          clearCache: true,
          incognito: true,
          useOnDownloadStart: true,
        ),
      ),
      onDownloadStartRequest: (controller, request) => launchUrl(request.url),
    );
  }
}
