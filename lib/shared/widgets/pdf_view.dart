import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/// Represents MyPdfView for Navigation
class MyPdfView extends StatefulWidget {
  const MyPdfView({super.key, this.sourceUrl});

  final String? sourceUrl;
  @override
  _MyPdfView createState() => _MyPdfView();
}

class _MyPdfView extends State<MyPdfView> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.bookmark,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        widget.sourceUrl!,
        key: _pdfViewerKey,
      ),
    );
  }
}