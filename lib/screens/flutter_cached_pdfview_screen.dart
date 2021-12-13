import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/pdf_data.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class FlutterCachedPdfviewScreen extends StatefulWidget {
  const FlutterCachedPdfviewScreen({Key? key}) : super(key: key);

  @override
  State<FlutterCachedPdfviewScreen> createState() => _FlutterCachedPdfviewScreenState();
}

class _FlutterCachedPdfviewScreenState extends State<FlutterCachedPdfviewScreen> with AutomaticKeepAliveClientMixin {
  late PDFViewController controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final text = '${indexPage + 1} of $pages';
    return Scaffold(
      appBar: AppBar(
        title: const Text('flutter_cached_pdfview'),
        actions: pages >= 2
            ? [
                Center(child: Text(text)),
                IconButton(
                  icon: const Icon(Icons.chevron_left, size: 32),
                  onPressed: () {
                    final page = indexPage == 0 ? pages : indexPage - 1;
                    controller.setPage(page);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, size: 32),
                  onPressed: () {
                    final page = indexPage == pages - 1 ? 0 : indexPage + 1;
                    controller.setPage(page);
                  },
                ),
              ]
            : null,
      ),
      body: PDF(
        autoSpacing: false,
        // swipeHorizontal: true,
        pageSnap: false,
        pageFling: false,
        // swipeHorizontal: true,
        onViewCreated: (controller) => //
            setState(() => this.controller = controller),
        onRender: (pages) => setState(() {
          if (pages != null) this.pages = pages;
        }),
        onPageChanged: (indexPage, _) => setState(() {
          if (indexPage != null) this.indexPage = indexPage;
        }),
      ).cachedFromUrl(
        PdfData.pdfUrl,
        placeholder: (progress) => Center(child: Text('$progress %')),
        errorWidget: (error) => Center(child: Text('error: $error')),
        key: ValueKey(PdfData.pdfUrl),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var count = await controller.getPageCount();
          if (count != null) controller.setPage(count);
        },
        child: Text('$pages'),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
