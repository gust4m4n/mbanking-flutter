import 'dart:async';

import 'package:intl/intl.dart';

import '../../utils/all_utils.dart';
import '../../viewmodels/mbx_anti_jailbreak_vm.dart';
import '../../viewmodels/mbx_biometric_vm.dart';
import '../../viewmodels/mbx_security_vm.dart';
import '../../widgets/all_widgets.dart';
import '../demo_barcode_screen/demo_barcode_screen.dart';
import '../demo_drawer_screen/demo_drawer_screen.dart';
import '../demo_linechart_screen/demo_linechart_screen.dart';
import '../demo_login_screen/demo_login_screen.dart';
import '../demo_pdf_screen/demo_pdf_screen.dart';
import '../demo_photo_picker/demo_photo_picker.dart';
import '../demo_piechart_screen/demo_piechart_screen.dart';
import '../demo_qr_code_screen/demo_qr_code_screen.dart';
import '../demo_search_picker/demo_search_picker.dart';
import '../demo_string_picker/demo_string_picker.dart';
import '../demo_webview_screen/demo_webview_screen.dart';
import '../mbx_profile_page/mbx_profile_page.dart';

class DemoController extends SuperController {
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onDetached() {
    LoggerX.log('[DemoController] onDetached');
  }

  @override
  void onInactive() {
    LoggerX.log('[DemoController] onInactive');
  }

  @override
  void onPaused() {
    LoggerX.log('[DemoController] onPaused');
  }

  @override
  Future<void> onResumed() async {
    LoggerX.log('[DemoController] onResumed');
    await MbxAntiJailbreakVM.check();
  }

  btnOnboardingClicked() {}

  btnLoginClicked() {
    Get.to(DemoLoginScreen());
  }

  btnProfileClicked() {
    Get.to(MbxProfilePage());
  }

  btnOtpClicked() {}

  btnPinClicked() {}

  btnPinSheetClicked() {}

  btnBiometricClicked() {
    MbxBiometricVM.available().then((available) {
      MbxBiometricVM.authenticate().then((authenticated) {});
    });
  }

  btnListViewClicked() {}

  btnGridViewClicked() {}

  btnDrawerClicked() {
    Get.to(DemoDrawerScreen());
  }

  btnImageClicked() {}

  btnCarouselClicked() {}

  btnDatabaseClicked() {}

  btnWebViewClicked() {
    Get.to(DemoWebViewScreen());
  }

  btnHtmlClicked() {}

  btnPdfClicked() {
    Get.to(DemoPdfScreen());
  }

  btnQrCodeClicked() {
    Get.to(DemoQRCodeScreen());
  }

  btnQrScanClicked() {}

  btnBarcodeClicked() {
    Get.to(DemoBarcodeScreen());
  }

  btnTabBarClicked() {}

  btnBottomNavBarClicked() {}

  btnLineChartClicked() {
    Get.to(DemoLineChartScreen());
  }

  btnPieChartClicked() {
    Get.to(DemoPieChartScreen());
  }

  btnToastClicked() {
    ToastX.show(msg: LoremIpsumX.medium());
  }

  btnSnackBarClicked() {
    ToastX.snackBar(msg: LoremIpsumX.medium());
  }

  btnInternetOfflineClicked() {
    ToastX.snackBarCustom(
      widget: InternetOfflineToast(),
      duration: 0,
    );
  }

  btnInternetOnlineClicked() {
    ToastX.snackBarCustom(
      widget: InternetOnlineToast(),
      duration: 4000,
    );
  }

  btnDialogClicked() {
    DialogX.showMessage(
        icon: ImageX(
          url: 'lib/images/ic_demo_logo.png',
          width: 64.0,
          height: 64.0,
          fit: BoxFit.contain,
        ),
        title: LoremIpsumX.tiny(),
        message: LoremIpsumX.medium(),
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: 'Cancel',
        onRightBtnClicked: () {
          Get.back();
        });
  }

  btnBottomSheetClicked() {
    SheetX.showMessage(
        icon: ImageX(
          url: 'lib/images/ic_demo_logo.png',
          width: 64.0,
          height: 64.0,
          fit: BoxFit.contain,
        ),
        title: LoremIpsumX.tiny(),
        message: LoremIpsumX.medium(),
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: 'Cancel',
        onRightBtnClicked: () {
          Get.back();
        });
  }

  btnLoadingClicked() {
    Get.loading();
    Timer(Duration(seconds: 5), () {
      Get.back();
    });
  }

  btnShareTextClicked() {
    Share.share('Check out my website https://example.com');
  }

  btnShareImageClicked() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      Share.shareXFiles([pickedFile]);
    }
  }

  btnReceiptClicked() {}

  btnImagePickerClicked() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      SheetX.showMessage(
          title: 'Image Picker',
          message: pickedFile.path,
          leftBtnTitle: 'OK',
          onLeftBtnClicked: () {
            Get.back();
          },
          rightBtnTitle: '',
          onRightBtnClicked: () {});
    }
  }

  btnPhotoPickerClicked() async {
    final sheet = DemoPhotoPicker();
    sheet.show().then((value) async {
      LoggerX.log('value: $value');
      if (value == 'camera') {
        final imagePicker = ImagePicker();
        final pickedFile = await imagePicker.pickImage(
            source: ImageSource.camera,
            imageQuality: 80,
            maxWidth: 1024.0,
            maxHeight: 1024.0,
            preferredCameraDevice: CameraDevice.front);
        if (pickedFile != null) {
          // photoSelfie = pickedFile.path;
          Get.back();
        }
      } else if (value == 'gallery') {
        final imagePicker = ImagePicker();
        final pickedFile = await imagePicker.pickImage(
            source: ImageSource.gallery,
            imageQuality: 80,
            maxWidth: 1024.0,
            maxHeight: 1024.0,
            preferredCameraDevice: CameraDevice.front);
        if (pickedFile != null) {
          // photoSelfie = pickedFile.path;
          Get.back();
        }
      }
    });
  }

  btnStringPickerClicked() {
    final sheet = DemoStringPicker(
        title: 'String Picker', list: ['One', 'Two', 'Three', 'Four', 'Five']);
    sheet.show().then((value) {
      if (value != null) {
        LoggerX.log('Selection: $value');
      }
    });
  }

  btnDatePickerClicked() {
    showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        final dt = DateFormat('dd MMMM yyyy').format(date);
        LoggerX.log('date: $dt');
      }
    });
  }

  btnSearchPickerClicked() {
    final sheet = DemoSearchPicker(title: 'Search Picker');
    sheet.show().then((value) {
      if (value != null) {
        LoggerX.log('Selection: ${value.title}');
      }
    });
  }

  btnBase64Clicked() {
    Base64Utils.demo();
    final plain = LoremIpsumX.medium();
    var encoded = Base64Utils.encode(Utf8Utils.encode(plain));
    var decoded = Base64Utils.decode(encoded);

    SheetX.showMessage(
        title: 'Base64',
        message:
            'plain: $plain\nencoded: $encoded\ndecoded: ${Utf8Utils.decode(decoded)}',
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: '',
        onRightBtnClicked: () {});
  }

  btnM5Clicked() {
    Md5Utils.demo();
    final plain = LoremIpsumX.medium();
    final digest = Md5Utils.convert(Utf8Utils.encode(plain));

    SheetX.showMessage(
        title: 'MD5',
        message: 'plain: $plain\ndigest: ${HexUtils.encode(digest)}',
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: '',
        onRightBtnClicked: () {});
  }

  btnShaClicked() {
    ShaUtils.demo();
    final plain = LoremIpsumX.medium();
    final digest = ShaUtils.convert(Utf8Utils.encode(plain));

    SheetX.showMessage(
        title: 'SHA',
        message: 'plain: $plain\ndigest: ${HexUtils.encode(digest)}',
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: '',
        onRightBtnClicked: () {});
  }

  btnAesClicked() {
    AesUtils.demo();
    final plain = LoremIpsumX.medium();
    const key =
        'd3b91f0ebf75cc407114307b0ed67f3cd3b91f0ebf75cc407114307b0ed67f3c';
    const iv = '89e4ea9f678d2e94d9548043f54db492';
    final encrypted = AesUtils.encrypt(
        Utf8Utils.encode(plain), HexUtils.decode(key), HexUtils.decode(iv));
    final decrypted =
        AesUtils.decrypt(encrypted, HexUtils.decode(key), HexUtils.decode(iv));
    LoggerX.log('[AES] plain: $plain\n');
    LoggerX.log('[AES] encrypted: ${HexUtils.encode(encrypted)}\n');
    LoggerX.log('[AES] decrypted: ${Utf8Utils.decode(decrypted)}\n');

    SheetX.showMessage(
        title: 'AES',
        message:
            'plain: $plain\nencrypted: ${HexUtils.encode(encrypted)}\ndecrypted: ${Utf8Utils.decode(decrypted)}',
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: '',
        onRightBtnClicked: () {});
  }

  btnXorClicked() {
    XorUtils.demo();

    final plain = LoremIpsumX.medium();
    const key =
        '9b2611f319e2c88f1dce0a7a612bcf1f5b037bc66b9e8144725da7faf16cc3f2';
    final encrypted =
        XorUtils.encrypt(Utf8Utils.encode(plain), Utf8Utils.encode(key));
    final decrypted = XorUtils.decrypt(encrypted, Utf8Utils.encode(key));

    SheetX.showMessage(
        title: 'XOR',
        message:
            'plain: $plain\nencrypted: ${HexUtils.encode(encrypted)}\ndecrypted: $decrypted',
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: '',
        onRightBtnClicked: () {});
  }

  btnCrcClicked() {
    CrcUtils.demo();
    final plain = LoremIpsumX.medium();
    final value = CrcUtils.convert(Utf8Utils.encode(plain));

    SheetX.showMessage(
        title: 'CRC',
        message: 'plain: $plain\nCRC: $value',
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: '',
        onRightBtnClicked: () {});
  }

  btnHexClicked() {
    HexUtils.demo();
    final plain = LoremIpsumX.medium();
    final encoded = HexUtils.encode(Utf8Utils.encode(plain));
    final decoded = HexUtils.decode(encoded);

    SheetX.showMessage(
        title: 'HEX',
        message:
            'plain: $plain\nencoded: $encoded\ndecoded: ${Utf8Utils.decode(decoded)}',
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: '',
        onRightBtnClicked: () {});
  }

  btnDoubleEncryptClicked() {
    final plain = LoremIpsumX.medium();
    final encrypted = MbxSecurityVM.doubleEncrypt(Utf8Utils.encode(plain));
    final decrypted = MbxSecurityVM.doubleDecrypt(encrypted);

    SheetX.showMessage(
        title: 'DoubleEncrypt',
        message:
            'plain: $plain\nencrypted: ${HexUtils.encode(encrypted)}\ndecrypted: ${Utf8Utils.decode(decrypted)}',
        leftBtnTitle: 'OK',
        onLeftBtnClicked: () {
          Get.back();
        },
        rightBtnTitle: '',
        onRightBtnClicked: () {});
  }

  @override
  void onHidden() {}
}
