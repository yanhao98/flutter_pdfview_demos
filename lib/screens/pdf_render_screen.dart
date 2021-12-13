import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/pdf_data.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:pdf_render/pdf_render_widgets.dart';

class PdfRenderScreen extends StatelessWidget {
  const PdfRenderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PdfRenderScreen'),
      ),
      body: FutureBuilder<File>(
        future: DefaultCacheManager().getSingleFile(PdfData.pdfUrl),
        builder: (context, snapshot) => snapshot.hasData //
            ? PdfViewer.openFile(
                snapshot.data!.path,
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
