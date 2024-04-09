import '../../widgets/all_widgets.dart';
import 'demo_controller.dart';

class DemoScreen extends StatelessWidget {
  DemoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoController>(
        init: DemoController(),
        builder: (controller) => ScreenX(
            headerView: NavigationBarX(
              title: 'DemoFlutter',
            ),
            lightStatusBar: true,
            bottomPadding: true,
            bodyView: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: <Widget>[
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Login and Accounts',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Onboarding',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    controller.btnOnboardingClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'Login',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    controller.btnLoginClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Profile',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    controller.btnProfileClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('OTP and PIN',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'OTP',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnOtpClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'PIN',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnPinClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'PIN Sheet',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnPinSheetClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'Biometric',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnBiometricClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Grid and ListView',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'ListView',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnListViewClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'GridView',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnGridViewClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Drawer',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnDrawerClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                  child: ButtonX(
                                title: 'Image',
                                backgroundColor: ColorX.yellow,
                                onClicked: () {
                                  controller.btnImageClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'Carousel',
                                backgroundColor: ColorX.yellow,
                                onClicked: () {
                                  controller.btnCarouselClicked();
                                },
                              )),
                              const SizedBox(width: 4.0),
                              Expanded(
                                  child: ButtonX(
                                title: 'Database',
                                backgroundColor: ColorX.yellow,
                                onClicked: () {
                                  controller.btnDatabaseClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('WebViews',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'WebView',
                                backgroundColor: ColorX.red,
                                onClicked: () {
                                  controller.btnWebViewClicked();
                                },
                              )),
                              const SizedBox(width: 4.0),
                              Expanded(
                                  child: ButtonX(
                                title: 'HTML',
                                backgroundColor: ColorX.red,
                                onClicked: () {
                                  controller.btnHtmlClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'PDF',
                                backgroundColor: ColorX.red,
                                onClicked: () {
                                  controller.btnPdfClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('QR and Barcodes',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'QR Code',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    controller.btnQrCodeClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'QR Scan',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    controller.btnQrScanClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Barcode',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    controller.btnBarcodeClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('TabBar',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'TabBar',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnTabBarClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'BottomNavBar',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnBottomNavBarClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Charts',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'LineChart',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnLineChartClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'PieChart',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnPieChartClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Alert and Toasts',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Toast',
                                  backgroundColor: ColorX.red,
                                  onClicked: () {
                                    controller.btnToastClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'SnackBar',
                                  backgroundColor: ColorX.red,
                                  onClicked: () {
                                    controller.btnSnackBarClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Internet Offline',
                                  backgroundColor: ColorX.red,
                                  onClicked: () {
                                    controller.btnInternetOfflineClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'Internet Online',
                                  backgroundColor: ColorX.red,
                                  onClicked: () {
                                    controller.btnInternetOnlineClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'Dialog',
                                backgroundColor: ColorX.red,
                                onClicked: () {
                                  controller.btnDialogClicked();
                                },
                              )),
                              const SizedBox(width: 4.0),
                              Expanded(
                                  child: ButtonX(
                                title: 'Bottom Sheet',
                                backgroundColor: ColorX.red,
                                onClicked: () {
                                  controller.btnBottomSheetClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'Loading',
                                backgroundColor: ColorX.red,
                                onClicked: () {
                                  controller.btnLoadingClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Share',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Text',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    controller.btnShareTextClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'Image',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    controller.btnShareImageClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Receipt',
                                  backgroundColor: ColorX.teal,
                                  onClicked: () {
                                    controller.btnReceiptClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Pickers',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Image Picker',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnImagePickerClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'Photo Picker',
                                  backgroundColor: ColorX.green,
                                  onClicked: () {
                                    controller.btnPhotoPickerClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'String Picker',
                                backgroundColor: ColorX.green,
                                onClicked: () {
                                  controller.btnStringPickerClicked();
                                },
                              )),
                              const SizedBox(width: 4.0),
                              Expanded(
                                  child: ButtonX(
                                title: 'Search Picker',
                                backgroundColor: ColorX.green,
                                onClicked: () {
                                  controller.btnSearchPickerClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: ButtonX(
                                title: 'Date Picker',
                                backgroundColor: ColorX.green,
                                onClicked: () {
                                  controller.btnDatePickerClicked();
                                },
                              )),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          const ContainerX(
                            backgroundColor: ColorX.gray,
                            width: double.infinity,
                            padding: EdgeInsets.all(4.0),
                            cornerRadius: 8.0,
                            child: TextX('Crypto',
                                color: ColorX.white,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.center,
                                maxLines: 1),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'Base64',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnBase64Clicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'MD5',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnM5Clicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'SHA',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnShaClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'AES',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnAesClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'XOR',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnXorClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'CRC',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnCrcClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                child: ButtonX(
                                  title: 'HEX',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnHexClicked();
                                  },
                                ),
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: ButtonX(
                                  title: 'DoubleEncrypt',
                                  backgroundColor: ColorX.yellow,
                                  onClicked: () {
                                    controller.btnDoubleEncryptClicked();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
