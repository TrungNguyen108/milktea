import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PDFView extends StatefulWidget {
  const PDFView({
    Key? key,
  }) : super(key: key);

  @override
  _PDFViewState createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(
        build: (format) => _createPdf( format,),
      ),
    );
  }
  Future<Uint8List> _createPdf(PdfPageFormat format,) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_4,compress: true,);
    pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.SizedBox(
            width: double.infinity,
            child: pw.FittedBox(
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.start,
                  children: [
                    pw.Expanded(
                      child: pw.Column(

                      )
                    ),
                  ]
                )
            ),
          );
        },
      ),
    );
    return pdf.save();
  }
}