import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoDrawerController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }

  openDrawer() {
    scaffoldKey.currentState!.openDrawer();
  }

  closeDrawer() {
    scaffoldKey.currentState!.openEndDrawer();
  }
}
