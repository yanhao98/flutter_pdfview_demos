import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/flutter_cached_pdfview_screen.dart';
import 'package:flutter_application_2/screens/native_pdf_renderer_screen.dart';

import './screens/pdf_render_screen.dart';
import './screens/syncfusion_flutter_pdfviewer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // #region flutter_cached_pdfview
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FlutterCachedPdfviewScreen(),
                      ));
                },
                child: const Text('flutter_cached_pdfview')),
            // #endregion

            // #region SyncfusionFlutterPdfviewerScreen
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SyncfusionFlutterPdfviewerScreen(),
                      ));
                },
                child: const Text('SyncfusionFlutterPdfviewerScreen')),
            // #endregion

            // #region NativePdfRenderer
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NativePdfRendererScreen(),
                      ));
                },
                child: const Text('NativePdfRenderer')),
            // #endregion

            // #region PdfRenderScreen
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PdfRenderScreen(),
                      ));
                },
                child: const Text('PdfRenderScreen')),
            // #endregion
          ],
        ),
      ),
    );
  }
}
