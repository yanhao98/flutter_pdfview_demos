import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/pdf_data.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SyncfusionFlutterPdfviewerScreen extends StatelessWidget {
  const SyncfusionFlutterPdfviewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SyncfusionFlutterPdfviewerScreen'),
      ),
      body: SfPdfViewer.network(PdfData.pdfUrl),
    );
  }
}
