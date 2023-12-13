import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(MyApp());
}

// Criar um arquivo para adicionar esse controller
class QRCodeController extends GetxController {
  final RxString qrCodeData = ''.obs;

  void updateQRCodeData(String data) {
    qrCodeData.value = data;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final QRCodeController qrCodeController = Get.put(QRCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 80,
              child: InkWell(
                onTap: ()=> Get.to(() => buildQrView(context)),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Expanded(
                         child: Padding(
                           padding: const EdgeInsets.only(top: 10),
                           child: Icon(Icons.qr_code_scanner),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: 10),
                         child: Text(
                             "Scan Code",
                             style: TextStyle(
                               fontWeight: FontWeight.bold
                             ),
                         ),
                       )
                    ],
                  ),
                ),
              ),
            ),
            Obx(() => Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Container(
                child: Text(
                  qrCodeController.qrCodeData.value,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  // Adicionar no controller também
  Widget buildQrView(BuildContext context){
    var scanArea = (Get.width < 400 ||
        Get.height < 400)
        ? 150.0
        : 300.0;

    return QRView(
      key: GlobalKey(),
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.green,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((Barcode scanData) {
      qrCodeController.updateQRCodeData(scanData.code!);
      Get.back();
    });
  }
}
