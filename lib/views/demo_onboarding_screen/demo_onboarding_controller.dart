import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../viewmodels/demo_movie_list_vm.dart';

class DemoOnboardingController extends GetxController {
  final PageController pageController = PageController();
  var movieListVM = DemoMovieListVM();

  @override
  void onReady() {
    super.onReady();
    movieListVM.nextPage().then((resp) {
      if (resp.status == 200) {
        update();
      }
    });
  }

  btnBackClicked() {
    Get.back();
  }
}
