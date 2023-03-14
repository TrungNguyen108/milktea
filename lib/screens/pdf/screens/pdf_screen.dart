import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

import '../model/pdf_order_dio.dart';

class PDFView extends ConsumerStatefulWidget {
  const PDFView({Key? key}) : super(key: key);

  @override
  _PDFViewState createState() => _PDFViewState();
}

class _PDFViewState extends ConsumerState<PDFView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pdf_order = ref.watch(futurePdfOrderProvider('1'));
    return Scaffold(
      body: PdfPreview(
        build: (format , PdfProductModel) => _createPdf( format , pdf_order),
      ),
    );
  }

  Future<Uint8List> _createPdf(PdfPageFormat format, items) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_4,compress: true,);
    final ByteData bytes = await rootBundle.load('assets/image/order_detail.png');
    final Uint8List byteList = bytes.buffer.asUint8List();
    final mulishRegular = await PdfGoogleFonts.mulishRegular();
    final mulishBold = await PdfGoogleFonts.mulishBold();
    print(items);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: format,
        margin: pw.EdgeInsets.zero,
        build: (context) {
          return [
            pw.Container(
              child: pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Expanded(
                        flex: 2,
                        child:pw.Container(
                            padding: pw.EdgeInsets.only(top: 50,bottom: 67,left: 20,right: 20),
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
                                                height: 150,
                                                width: 150,
                                                child: pw.Image(pw.MemoryImage(byteList), height: 150, width: 150,fit: pw.BoxFit.fitHeight),
                                              )
                                          ),
                                        ]
                                    ),
                                  ),
                                  pw.SizedBox(height: 40),
                                  pw.Text('Thông tin', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'),fontSize: 20,fontWeight: pw.FontWeight.bold)),
                                  pw.SizedBox(height: 15),
                                  pw.Text("10/10/1999", style: pw.TextStyle(fontSize: 15),),
                                  pw.SizedBox(height: 10),
                                  pw.Text("trungnguyen.nina@gmail.com", style: pw.TextStyle(fontSize: 15)),
                                  pw.SizedBox(height: 10),
                                  pw.Text("0909090909", style: pw.TextStyle(fontSize: 15)),
                                  pw.SizedBox(height: 10),
                                  pw.Text("Quân 12", style: pw.TextStyle(fontSize: 15)),
                                  pw.SizedBox(height: 15),
                                  pw.SizedBox(height: 1,child: pw.Container(color: PdfColor.fromHex('fdd392'))),
                                  pw.SizedBox(height: 15),

                                  pw.Text('Kỹ năng', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'),font: mulishBold ,fontSize: 20,fontWeight: pw.FontWeight.bold)),
                                  pw.SizedBox(height: 15),
                                  pw.Text('Tin học văn phòng', style: pw.TextStyle(color: PdfColor.fromHex('000000'),font: mulishBold,fontSize: 16,fontWeight: pw.FontWeight.bold)),
                                  pw.SizedBox(height: 15),
                                  pw.Text("Word ", style: pw.TextStyle(fontSize: 15),),
                                  pw.SizedBox(height: 10),
                                  pw.Text("Excel", style: pw.TextStyle(fontSize: 15,height: 2)),
                                  pw.SizedBox(height: 10),
                                  pw.Text("Power Point", style: pw.TextStyle(fontSize: 15)),
                                  pw.SizedBox(height: 10),
                                  pw.Text("Adobe Photoshop", style: pw.TextStyle(fontSize: 15)),
                                  pw.SizedBox(height: 15),
                                  pw.SizedBox(height: 1,child: pw.Container(color: PdfColor.fromHex('fdd392'))),

                                  pw.SizedBox(height: 10),
                                  pw.Text('Sở thích', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'), font: mulishBold,fontSize: 20,fontWeight: pw.FontWeight.bold)),
                                  pw.SizedBox(height: 10),
                                  pw.Text("Đọc sách, thể thao", style: pw.TextStyle(fontSize: 15,font: mulishRegular)),

                                ]
                            )
                        )
                    ),
                    pw.Expanded(
                        flex: 3,
                        child:pw.Container(
                            padding: pw.EdgeInsets.only(top: 30,left: 20,right: 20),
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                crossAxisAlignment: pw.CrossAxisAlignment.start,
                                children: [
                                  pw.Text('Mục tiêu sự nghiệp', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'),fontSize: 20,font: mulishBold)),
                                  pw.SizedBox(height: 10),
                                  pw.Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                    style: pw.TextStyle(fontSize: 14),
                                  ),
                                  pw.SizedBox(height: 15),
                                  pw.SizedBox(height: 1,child: pw.Container(color: PdfColor.fromHex('fdd392'))),
                                  pw.SizedBox(height: 15),

                                  pw.Text('Học vấn', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'),fontSize: 18,font: mulishBold)),
                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                      mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Text('Quản trị doanh nghiệp',style: pw.TextStyle(color: PdfColor.fromHex('000000'),font: mulishBold,fontSize: 16,fontWeight: pw.FontWeight.bold)),
                                        pw.Text("05/2015 - 05/2020",style: pw.TextStyle(fontSize: 14,fontStyle: pw.FontStyle.italic,color: PdfColor.fromHex('4c4a4a') ),),
                                      ]
                                  ),
                                  pw.SizedBox(height: 10),
                                  pw.Text("Đại học TopCV",style: pw.TextStyle(fontSize: 14,color: PdfColor.fromHex('363434'),font: mulishRegular),),
                                  pw.SizedBox(height: 10),
                                  pw.Text("Tốt nghiệp loại giỏi",style: pw.TextStyle(fontSize: 14,color: PdfColor.fromHex('000000'),font: mulishRegular),),
                                  pw.SizedBox(height: 15),
                                  pw.SizedBox(height: 1,child: pw.Container(color: PdfColor.fromHex('fdd392'))),
                                  pw.SizedBox(height: 15),

                                  pw.Text('Kinh nghiệm làm việc', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'),fontSize: 18,font: mulishBold)),
                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                      mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Text('Nhân viên kinh doanh',style: pw.TextStyle(color: PdfColor.fromHex('000000'),font: mulishBold,fontSize: 16,fontWeight: pw.FontWeight.bold)),
                                        pw.Text("05/2015 - 05/2020",style: pw.TextStyle(fontSize: 14,fontStyle: pw.FontStyle.italic,color: PdfColor.fromHex('4c4a4a') ),),
                                      ]
                                  ),
                                  pw.SizedBox(height: 5),
                                  pw.Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                    style: pw.TextStyle(fontSize: 14),
                                  ),
                                  pw.SizedBox(height: 15),

                                  pw.Row(
                                      mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Text('Nhân viên kế toán',style: pw.TextStyle(color: PdfColor.fromHex('000000'),font: mulishBold,fontSize: 16,fontWeight: pw.FontWeight.bold)),
                                        pw.Text("05/2015 - 05/2020",style: pw.TextStyle(fontSize: 14,fontStyle: pw.FontStyle.italic,color: PdfColor.fromHex('4c4a4a') ),),
                                      ]
                                  ),
                                  pw.SizedBox(height: 5),
                                  pw.Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                    style: pw.TextStyle(fontSize: 14),
                                  ),
                                  pw.SizedBox(height: 15),

                                  pw.SizedBox(height: 1,child: pw.Container(color: PdfColor.fromHex('fdd392'))),
                                  pw.SizedBox(height: 15),

                                  pw.Text('Hoạt động', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'),fontSize: 20,font: mulishBold)),
                                  pw.SizedBox(height: 10),
                                  pw.Row(
                                      mainAxisAlignment:pw.MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                                      children: [
                                        pw.Text('Tình nguyện viên',style: pw.TextStyle(color: PdfColor.fromHex('000000'),font: mulishBold,fontSize: 16,fontWeight: pw.FontWeight.bold)),
                                        pw.Text("05/2015 - 05/2020",style: pw.TextStyle(fontSize: 14,fontStyle: pw.FontStyle.italic,color: PdfColor.fromHex('4c4a4a') ),),
                                      ]
                                  ),
                                  pw.SizedBox(height: 5),
                                  pw.Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                    style: pw.TextStyle(fontSize: 14),
                                  ),
                                  pw.SizedBox(height: 15),
                                  pw.SizedBox(height: 1,child: pw.Container(color: PdfColor.fromHex('fdd392'))),
                                  pw.SizedBox(height: 15),

                                  pw.Text('Chứng chỉ', style: pw.TextStyle(color: PdfColor.fromHex('ffa00c'),fontSize: 20,font: mulishBold)),
                                  pw.SizedBox(height: 10),
                                  pw.RichText(
                                      text: pw.TextSpan(
                                          children: [
                                            pw.TextSpan(text: '2018 : ',style: pw.TextStyle(color: PdfColor.fromHex('000000'),font: mulishBold,fontSize: 16,fontWeight: pw.FontWeight.bold)),
                                            pw.TextSpan(text: 'Giải nhất tài năng TopCV',style: pw.TextStyle(fontSize: 14,color: PdfColor.fromHex('000000'),font: mulishRegular))
                                          ]
                                      )
                                  )


                                ]
                            )
                        )
                    )
                  ]
              ),
            ),
            pw.Container(
              margin: pw.EdgeInsets.all(40),
              child: pw.Column(
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.start,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Image(pw.MemoryImage(byteList), height: 100, width: 100,fit: pw.BoxFit.fitHeight),
                      pw.SizedBox(width: 20),
                      pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Công Ty TNHH Test",style: pw.TextStyle(font: mulishBold, fontSize: 20)),
                          pw.SizedBox(height: 5),
                          pw.Row(children: [
                            pw.Text("Địa Chỉ:",style: pw.TextStyle(font: mulishBold, fontSize: 15)),
                            pw.Text(" Saigon Tel",style: pw.TextStyle(font: mulishRegular, fontSize: 14)),
                          ]),
                          pw.SizedBox(height: 5),
                          pw.Row(children: [
                            pw.Text("ĐT:",style: pw.TextStyle(font: mulishBold, fontSize: 15)),
                            pw.Text(" 0909999999 - 0909999999",style: pw.TextStyle(font: mulishRegular, fontSize: 14)),
                          ]),
                          pw.SizedBox(height: 5),
                          pw.Row(children: [
                            pw.Text("Email:",style: pw.TextStyle(font: mulishBold, fontSize: 15)),
                            pw.Text(" email@gmail.com",style: pw.TextStyle(font: mulishRegular, fontSize: 14)),
                          ]),
                        ],
                      )
                    ],
                  ),
                  pw.Container(
                    margin: pw.EdgeInsets.only(top: 30, bottom: 5),
                    child: pw.Text("HÓA ĐƠN BÁN HÀNG",style: pw.TextStyle(fontSize: 25, font: mulishBold),textAlign: pw.TextAlign.center,),
                  ),
                  pw.Text('Ngày: 13 Tháng: 3 Năm: 2023',style: pw.TextStyle(font: mulishRegular, fontSize: 15)),
                  pw.SizedBox(height: 15),
                  pw.Container(
                    margin: pw.EdgeInsets.only(bottom: 10),
                    child: pw.Column(
                      mainAxisAlignment: pw.MainAxisAlignment.start,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.RichText(
                            text: pw.TextSpan(
                                children: [
                                  pw.TextSpan(text: 'Khách Hàng : ',style: pw.TextStyle(font: mulishBold, fontSize: 17)),
                                  pw.TextSpan(text: 'Tên khách hàng',style: pw.TextStyle(font: mulishRegular, fontSize: 17))
                                ]
                            )
                        ),
                        pw.SizedBox(height: 10),
                        pw.RichText(
                            text: pw.TextSpan(
                                children: [
                                  pw.TextSpan(text: 'Mã Số Thuế : ',style: pw.TextStyle(font: mulishBold, fontSize: 17)),
                                  pw.TextSpan(text: 'A123BC',style: pw.TextStyle(font: mulishRegular, fontSize: 17))
                                ]
                            )
                        ),
                        pw.SizedBox(height: 10),
                        pw.RichText(
                            text: pw.TextSpan(
                                children: [
                                  pw.TextSpan(text: 'Địa Chỉ : ',style: pw.TextStyle(font: mulishBold, fontSize: 17)),
                                  pw.TextSpan(text: 'Quận 12',style: pw.TextStyle(font: mulishRegular, fontSize: 17))
                                ]
                            )
                        ),
                        pw.SizedBox(height: 10),
                        pw.Row(
                          children: [
                            pw.Text("Điện Thoại: ",
                                style: pw.TextStyle(
                                    font: mulishBold, fontSize: 17)),
                            pw.Text("0909999999",
                                style: pw.TextStyle(
                                    font: mulishRegular, fontSize: 17)),
                          ],
                        ),
                        pw.SizedBox(height: 20),
                        pw.Table(
                          border: pw.TableBorder.all(),
                          defaultVerticalAlignment:
                          pw.TableCellVerticalAlignment.middle,
                          columnWidths: {
                            0: pw.IntrinsicColumnWidth(),
                            1: pw.IntrinsicColumnWidth(),
                            2: pw.IntrinsicColumnWidth(),
                            3: pw.IntrinsicColumnWidth(),
                            4: pw.IntrinsicColumnWidth(),
                            5: pw.IntrinsicColumnWidth(),
                          },
                          children: [
                            pw.TableRow(
                              children: [
                                pdfTitle("STT", mulishBold),
                                pdfTitle("MĐH", mulishBold),
                                pdfTitle("Tên Sản Phẩm", mulishBold),
                                pdfTitle("SL", mulishBold),
                                pdfTitle("Đơn Giá", mulishBold),
                                pdfTitle("Thành Tiền", mulishBold),
                              ],
                            ),

                            pw.TableRow(
                              children: [
                                pdfTitle("1", mulishRegular),
                                pdfTitle("A001", mulishRegular),
                                pdfTitle("Jordan 1 Low All White", mulishRegular),
                                pdfTitle("1", mulishRegular),
                                pdfTitle("1.300.000đ", mulishRegular),
                                pdfTitle("1.300.000đ", mulishRegular),
                              ],
                            ),
                          ],
                        ),
                        pw.Table(
                          border: pw.TableBorder.all(),
                          defaultVerticalAlignment:
                          pw.TableCellVerticalAlignment.middle,
                          columnWidths: {
                            0: pw.FixedColumnWidth(41.5),
                            1: pw.IntrinsicColumnWidth(),
                          },
                          children: [
                            pw.TableRow(
                              children: [
                                pdfTitle("Thuế VAT 10% (nếu có)", mulishBold),
                                pdfTitle("", mulishRegular),
                              ],
                            ),
                          ],
                        ),
                        pw.Table(
                          border: pw.TableBorder.all(),
                          defaultVerticalAlignment:
                          pw.TableCellVerticalAlignment.middle,
                          columnWidths: {
                            0: pw.FixedColumnWidth(41.5),
                            1: pw.IntrinsicColumnWidth(),
                          },
                          children: [
                            pw.TableRow(
                              children: [
                                pdfTitle("Tổng cộng", mulishBold),
                                pdfTitle("", mulishRegular),
                              ],
                            ),
                          ],
                        ),
                        pw.SizedBox(height: 15),
                        pw.Container(
                            child: pw.Column(
                                children: [
                                  pw.Text(
                                      "Khách hàng",
                                      textAlign: pw.TextAlign.center,
                                      style: pw.TextStyle(
                                          font: mulishBold,
                                          fontSize: 15
                                      )
                                  ),
                                  pw.Text(
                                      "(ký & ghi rõ họ tên)",
                                      textAlign: pw.TextAlign.center,
                                      style: pw.TextStyle(
                                          font: mulishRegular,
                                          fontSize: 15
                                      )
                                  )
                                ]
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ];
        },
      ),
    );
    return pdf.save();
  }
  pw.Container pdfTitle(String title, pw.Font mulishRegular) {
    return pw.Container(
      padding: pw.EdgeInsets.all(5),
      child: pw.Text(title,
          style: pw.TextStyle(fontSize: 15, font: mulishRegular),
          textAlign: pw.TextAlign.center),
    );
  }
}