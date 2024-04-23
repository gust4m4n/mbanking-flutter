import '../../viewmodels/mbx_profile_vm.dart';
import '../../widgets/all_widgets.dart';
import 'mbx_profile_controller.dart';
import 'mbx_profile_menu_button.dart';

class MbxProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MbxProfileController>(
      init: MbxProfileController(),
      builder: (controller) => SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(children: [
            ContainerX(
                width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ContainerX(height: MediaQuery.of(Get.context!).padding.top),
                    ContainerX(
                        backgroundColor: ColorX.white,
                        width: 110.0,
                        height: 110.0,
                        cornerRadius: 55.0,
                        child: Center(
                            child: ImageX(
                          faIcon: MbxProfileVM.profile.photo.isEmpty
                              ? FontAwesomeIcons.user
                              : null,
                          color: MbxProfileVM.profile.photo.isEmpty
                              ? ColorX.gray
                              : null,
                          url: MbxProfileVM.profile.photo,
                          width:
                              MbxProfileVM.profile.photo.isEmpty ? 50.0 : 100.0,
                          height: 100.0,
                          cornerRadius: 50.0,
                        ))),
                    ContainerX(height: 8.0),
                    TextX(
                      MbxProfileVM.profile.name.isEmpty
                          ? '-'
                          : MbxProfileVM.profile.name,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w700,
                      color: ColorX.white,
                    ),
                    ContainerX(
                      height: 2.0,
                    ),
                    TextX(
                      MbxProfileVM.profile.phone.isEmpty
                          ? '-'
                          : MbxProfileVM.profile.phone,
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: ColorX.white,
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.all(16.0),
                child: ContainerX(
                  backgroundColor: ColorX.white,
                  cornerRadius: 16.0,
                  borderWidth: 0.5,
                  borderColor: ColorX.gray,
                  padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
                  child: Column(
                    children: [
                      MbaxProfileMenuButton(
                        title: 'Aktivasi Biometrik',
                        faIcon: FontAwesomeIcons.fingerprint,
                        onClicked: () {},
                        toggle: true,
                        toggleValue: controller.biometricEnabled,
                        onToggleChanged: (value) {
                          controller.biometricEnabled = value;
                          controller.toggleBiometric(value);
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'Ganti PIN',
                        faIcon: FontAwesomeIcons.key,
                        onClicked: () {
                          controller.btnChangePinClicked();
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'Syarat & Ketentuan',
                        faIcon: FontAwesomeIcons.shieldHalved,
                        onClicked: () {
                          controller.btnTncClicked();
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'Kebijakan Privasi',
                        faIcon: FontAwesomeIcons.shieldHalved,
                        onClicked: () {
                          controller.btnPrivacyPolicyClicked();
                        },
                      ),
                      MbaxProfileMenuButton(
                        title: 'Keluar',
                        faIcon: FontAwesomeIcons.powerOff,
                        onClicked: () {
                          controller.btnLogoutClicked();
                        },
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(left: 32.0, right: 32.0),
              child: TextX(
                controller.version,
                fontSize: 13.0,
                fontWeight: FontWeight.w500,
                color: ColorX.black,
              ),
            ),
            ContainerX(
                height: MediaQuery.of(Get.context!).padding.bottom +
                    60.0 +
                    30.0 +
                    16.0)
          ])),
    );
  }
}
