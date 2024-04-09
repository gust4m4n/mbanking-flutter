import '../../widgets/all_widgets.dart';
import 'demo_photo_picker_controller.dart';

// ignore: must_be_immutable
class DemoPhotoPicker extends GetWidget<AppxPhotoPickerController> {
  Future<T?> show<T>() {
    FocusManager.instance.primaryFocus?.unfocus();
    return SheetX.showWithGrip(
        backgroundColor: ColorX.white, cornerRadius: 32.0, widget: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppxPhotoPickerController>(
      init: AppxPhotoPickerController(),
      builder: (controller) => ContainerX(
        backgroundColor: ColorX.white,
        topLeftRadius: 32.0,
        topRightRadius: 32.0,
        child: Wrap(children: [
          ContainerX(height: 8.0),
          Container(
            margin: EdgeInsets.only(left: 32.0, right: 32.0),
            child: Row(
              children: [
                ButtonX(
                  backgroundColor: ColorX.transparent,
                  faIcon: FontAwesomeIcons.xmark,
                  faWidth: 16.0,
                  faHeight: 16.0,
                  faColor: ColorX.gray,
                  width: 32.0,
                  height: 32.0,
                  cornerRadius: 25.0,
                  borderWidth: 1.0,
                  borderColor: ColorX.gray,
                  onClicked: () {
                    controller.btnCloseClicked();
                  },
                ),
                Expanded(
                  child: TextX(
                    'Photo Picker',
                    color: ColorX.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 32.0, height: 32.0),
              ],
            ),
          ),
          ContainerX(height: 24.0),
          ContainerX(
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                children: [
                  ButtonX(
                      title: 'Camera',
                      titleColor: ColorX.black,
                      backgroundColor: ColorX.white,
                      borderWidth: 1.0,
                      borderColor: ColorX.lightGray,
                      onClicked: () {
                        controller.btnCameraClicked();
                      }),
                  SizedBox(height: 8.0),
                  ButtonX(
                      title: 'Gallery',
                      titleColor: ColorX.black,
                      backgroundColor: ColorX.white,
                      borderWidth: 1.0,
                      borderColor: ColorX.lightGray,
                      onClicked: () {
                        controller.btnGalleryClicked();
                      }),
                  SizedBox(height: 24.0),
                  SizedBox(height: MediaQuery.of(Get.context!).padding.bottom)
                ],
              )),
        ]),
      ),
    );
  }
}
