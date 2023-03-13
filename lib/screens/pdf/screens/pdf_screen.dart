import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    final ByteData bytes = await rootBundle.load('assets/image/order_detail.png');
    final Uint8List byteList = bytes.buffer.asUint8List();

    pdf.addPage(
      pw.Page(
        pageFormat: format,
        margin: pw.EdgeInsets.zero,
        build: (context) {
          return pw.Container(
            child: pw.Row(
              children: [
                pw.Expanded(
                  flex: 2,
                    child:pw.Container(
                      padding: pw.EdgeInsets.only(top: 50,bottom: 50,left: 20,right: 20),
                      color: PdfColor.fromHex('fffaf2'),
                      child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Center(
                            child: pw.Column(
                              children: [
                                pw.Text('NGUYEN VAN A', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'),fontSize: 20,fontWeight: pw.FontWeight.bold)),
                                pw.SizedBox(height: 5),
                                pw.Text('Digital Marketing', style: pw.TextStyle(color: PdfColor.fromHex('979694'),fontSize: 15)),
                                pw.SizedBox(height: 15),
                                pw.ClipOval(
                                    child: pw.Container(
                                      height: 200,
                                      width: 200,
                                      child: pw.Image(pw.MemoryImage(byteList), height: 200, width: 200,fit: pw.BoxFit.fitHeight),
                                    )
                                ),
                              ]
                            ),
                          ),
                          pw.SizedBox(height: 40),
                          pw.Text('Thông tin', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'),fontSize: 20,fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(height: 10),
                          pw.Text("10/10/1999", style: pw.TextStyle(fontSize: 15,height: ),),
                          pw.Text("trungnguyen.nina@gmail.com", style: pw.TextStyle(fontSize: 15,height: 2)),
                          pw.Text("0909090909", style: pw.TextStyle(fontSize: 15)),
                        ]
                      )
                    )
                ),
                pw.Expanded(
                  flex: 3,
                    child:pw.Container(

                    )
                )
              ]
            ),
          );
        },
      ),
    );
    return pdf.save();
  }
}