import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

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
  final dados = "".obs;
  TextEditingController inputController = TextEditingController();

  double size = 280.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => QrImageView(
                data: dados.value,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            ElevatedButton(
              onPressed: () => _generateQRCode(inputController.text),
              child: Text('Generate QR Code'),
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Digite o Código',
                labelText: 'Codigo *'
              ),
              controller: inputController,
              validator: (String? value){
                return (value == null) ? 'Informe um código' : null;
              },
            )
          ],
        ),
      ),
    );
  }

  void _generateQRCode(String data) {
    qrCodeController.updateQRCodeData(data);
    dados.value = data;
  }
}
