import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../models/mbx_receipt_model.dart';
import '../../viewmodels/mbx_receipt_vm.dart';
import '../../widgets/all_widgets.dart';

export 'dart:io';

export 'package:path_provider/path_provider.dart';

class MbxReceiptController extends GetxController {
  var receipt = MbxReceiptModel();
  var backToHome = false;
  var loading = false;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  void onReady() {
    super.onReady();
    receipt = Get.arguments['receipt'] as MbxReceiptModel;
    backToHome = Get.arguments['backToHome'] as bool;
    update();
    if (receipt.transaction_id.isEmpty) {
      loading = true;
      update();
      final receiptVM = MbxReceiptVM();
      receiptVM.request(transaction_i: receipt.transaction_id).then((resp) {
        receipt = receiptVM.receipt;
        loading = false;
        update();
      });
    }
  }

  btnBackClicked() async {
    if (backToHome) {
      Get.toNamed('/home');
    } else {
      Get.back();
    }
  }

  btnDownloadClicked() async {
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();

    final filename = 'RECEIPT-${receipt.transaction_id}.JPG';
    screenshotController
        .capture(delay: Duration(milliseconds: 0))
        .then((capturedImage) async {
      if (kIsWeb) {
        XFile.fromData(capturedImage!, mimeType: 'image/jpeg', name: filename)
            .saveTo(filename)
            .then((value) {});
      } else {
        try {
          final directory =
              await ExternalPath.getExternalStoragePublicDirectory(
                  ExternalPath.DIRECTORY_DOWNLOADS);
          final path = directory;
          final file = await File('$path/$filename');
          await file.writeAsBytes(capturedImage!);
          Get.snackbar('Success', 'Receipt has been downloaded');
        } catch (e) {
          Get.snackbar('Error', 'Failed to download receipt');
        }

        await ImageGallerySaver.saveImage(capturedImage!);
        Share.shareXFiles([
          XFile.fromData(capturedImage!, mimeType: 'image/jpeg', name: filename)
        ]);
      }
    }).catchError((onError) {
      print(onError);
    });
  }
}
