import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_collection/routes/navigation_service.dart';
import 'package:flutter_collection/utils/translator.dart';
import 'package:flutter_collection/widgets/general/confirm_dialog.dart';
import 'package:flutter_collection/widgets/general/custom_button.dart';
import 'package:flutter_collection/widgets/general/custom_scaffold.dart';
import 'package:flutter_collection/widgets/general/header.dart';
import 'package:flutter_collection/widgets/general/helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final router = GetIt.I<NavigationService>();
  final qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? _controller;


  _onQrViewCreated(QRViewController controller) {
    this._controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      Future.delayed(const Duration(seconds: 1), () {
        openPopup();
      });
    });
  }
   _onPermissionSet(BuildContext ctx, QRViewController ctrl, bool allowed) {
    if (!allowed) {
      Fluttertoast.showToast(msg: Translator.cameraPermission);
    //  openAppSettings();
    }
  }

  openPopup() async {
    await showDialog(
        context: context,
        builder: (ctx) => ConfirmPopup(
        content: Translator.cameraPermission,
        leftText: Translator.no,
        rightText: Translator.yes,
        onTapLeft: () => router.pop(),
        onTapRight: () {},
      ),
    );
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    if(Platform.isIOS) {
      _controller?.resumeCamera();
    } else {
      _controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          Header(
            canBack: true,
          ),
          btns(),
          Expanded(
            child: qrView(),
          ),
        ],
      ),
    );
  }

  double scanArea = Helper.width < 400 || Helper.height < 400 ? 250 : 300;

  qrView() => Container(
    child: QRView(
      key: qrKey,
      onQRViewCreated: _onQrViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.white,
        borderRadius: 8,
        borderLength: 15,
        borderWidth: 8,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    ),
  );

  btns() => Container(
    margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
    height: 60,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          onTap: () async {
            await _controller?.toggleFlash();
          },
          text: const Icon(Icons.bolt, color: Colors.white),
          height: 40,
        ),
        CustomButton(
          onTap: () async {
            await _controller?.pauseCamera();
          },
          text: const Icon(Icons.pause, color: Colors.white),
          height: 40,
        ),
        CustomButton(
          onTap: () async {
            await _controller?.resumeCamera();
          },
          text: const Icon(Icons.replay, color: Colors.white),
          height: 40,
        ),
        CustomButton(
          onTap: () async {
            await _controller?.flipCamera();
          },
          text: const Icon(Icons.flip_camera_android, color: Colors.white),
          height: 40,
        ),
      ],
    ),
  );


}