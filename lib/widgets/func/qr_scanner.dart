import 'package:flutter/material.dart';
import 'package:flutter_collection/widgets/custom_scaffold.dart';
import 'package:flutter_collection/widgets/header.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScanner extends StatefulWidget {
  QrScanner({Key? key}) : super(key: key);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Header(
            canBack: true,
          )
        ],
      )
    );
  }

  qrView() => Container(
    // child: QRView(

    // ),
  );
}