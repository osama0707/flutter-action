import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart' as pw;

import 'package:octo_image/octo_image.dart';
// import 'package:cross_file/cross_file.dart' as cross_file;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "السلام عليكم",
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width / 15,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              final pdf = pw.Document();
              pdf.addPage(
                pw.Page(
                  build: (pw.Context context) =>
                  pw.Column(children: [
                    pw.Expanded(
                      child: pw.Text("1"),
                    ),
                    pw.Expanded(
                      child: pw.Text("2"),
                    ),
                    pw.Expanded(
                      child: pw.Text("3"),
                    ),
                    pw.Expanded(
                      child: pw.Text("4", textAlign: pw.TextAlign.center),
                    ),
                    
                  ],
                  crossAxisAlignment: pw.CrossAxisAlignment.center,
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  )
                      // pw.Center(child: pw.Text('1')),
                ),
              );

              final file = File("C:/Users/Admin/Desktop/example6.pdf");
              await file.writeAsBytes(await pdf.save());
              print('PDF created at: ${file.path}');
            },
            child: const Text("go"),
          ),
          OctoImage.fromSet(
            fit: BoxFit.cover,
            image: const CachedNetworkImageProvider(
              'https://www.w3.org/Graphics/PNG/text2.png',
            ),
            octoSet: OctoSet.circleAvatar(
              backgroundColor: Colors.red,
              text: const Text("M"),
            ),
          )
        ],
      ),
    ));
  }
}
