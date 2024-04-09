import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoTabBarController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  btnBackClicked() {
    Get.back();
  }
}
