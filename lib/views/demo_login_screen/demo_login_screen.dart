import '../../widgets/all_widgets.dart';
import 'demo_login_controller.dart';

class DemoLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoLoginController>(
        init: DemoLoginController(),
        builder: (controller) => ScreenX(
            lightStatusBar: false,
            topPadding: true,
            bottomPadding: true,
            bodyView: Scrollbar(
                child: SingleChildScrollView(
                    child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),
                ImageX(
                  url: 'lib/images/ic_demo_logo.png',
                  width: 128.0,
                  height: 128.0,
                ),
                SizedBox(
                  height: 4.0,
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'Username',
                        color: ColorX.gray,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                        hint: 'Type your username',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        controller: controller.txtUsernameController,
                        focusNode: controller.txtUsernameNode,
                      ),
                      Visibility(
                          visible: controller.txtUsernameError.isNotEmpty,
                          child: Column(
                            children: [
                              const SizedBox(height: 4.0),
                              TextX(
                                controller.txtUsernameError,
                                color: ColorX.red,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'Password',
                        color: ColorX.gray,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                        hint: 'Type your password',
                        obscureText: controller.securedPassword,
                        keyboardType: TextInputType.text,
                        readOnly: false,
                        rightIcon: ImageX(
                          faIcon: controller.securedPassword
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          width: 16.0,
                          height: 16.0,
                          fit: BoxFit.contain,
                        ),
                        rightIconColor: controller.securedPassword
                            ? ColorX.gray
                            : ColorX.black,
                        rightAction: () {
                          controller.securedPassword =
                              !controller.securedPassword;
                          controller.update();
                        },
                        controller: controller.txtPasswordController,
                        focusNode: controller.txtPasswordNode,
                      ),
                      Visibility(
                          visible: controller.txtPasswordError.isNotEmpty,
                          child: Column(
                            children: [
                              const SizedBox(height: 4.0),
                              TextX(
                                controller.txtPasswordError,
                                color: ColorX.red,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextX(
                        'Role',
                        color: ColorX.gray,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 4.0),
                      TextFieldX(
                        hint: 'Select region...',
                        obscureText: false,
                        keyboardType: TextInputType.text,
                        readOnly: true,
                        rightIcon: ImageX(
                          faIcon: FontAwesomeIcons.chevronDown,
                          width: 16.0,
                          height: 16.0,
                          fit: BoxFit.contain,
                        ),
                        rightIconColor: ColorX.black,
                        rightAction: () {
                          controller.btnRegionDropdownClicked();
                        },
                        controller: controller.txtRegionController,
                      ),
                      Visibility(
                          visible: controller.txtRegionError.isNotEmpty,
                          child: Column(
                            children: [
                              const SizedBox(height: 4.0),
                              TextX(
                                controller.txtRegionError,
                                color: ColorX.red,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w400,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                ContainerX(
                  padding: const EdgeInsets.only(
                      left: 24.0, top: 8.0, right: 24.0, bottom: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ButtonX(
                          width: 150.0,
                          height: 32.0,
                          title: 'Forgot Password?',
                          titleColor: ColorX.black,
                          fontSize: 17.0,
                          backgroundColor: ColorX.transparent,
                          onClicked: () {
                            controller.btnForgotPasswordClicked();
                          },
                        ),
                        SizedBox(height: 16.0),
                        ButtonX(
                          title: 'Sign In',
                          onClicked: () {
                            controller.btnSignInClicked();
                          },
                        )
                      ]),
                )
              ],
            )))));
  }
}
