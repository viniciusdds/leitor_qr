import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final Rx<Uint8List> bytes = Uint8List(0).obs;
  final TextEditingController inputController = TextEditingController();
  final RxString outputController = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    inputController.addListener(() {

    });
  }

  Future<void> generateBarCode(String inputCode) async {
    // Uint8List result = await scanner.generateBarCode(inputCode);
    // bytes.value = result;
  }

  Future<void> scanBytes() async {
    // XFile? picked = await ImagePicker().pickImage(source: ImageSource.camera);
    // if(picked == null) return;
    //
    // File file = File(picked.path);
    // Uint8List scannedBytes = await file.readAsBytes();
    //
    // String barcode = await scanner.scanBytes(scannedBytes);
    // outputController.value = barcode;
  }

  Future scan() async {
    // await Permission.camera.request();
    // String? barcode = await scanner.scan();
    // if (barcode == null) {
    //   print('nothing return.');
    // } else {
    //     outputController.value = barcode;
    // }
  }



}