import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mbankingflutter/models/mbx_transfer_history_model.dart';
import 'package:mbankingflutter/viewmodels/mbx_transfer_history_list_vm.dart';

class MbxTransferController extends GetxController {
  final scrollController = ScrollController();
  var historyListVM = MbxTransferHistoryListVM();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    nextPage();
  }

  btnBackClicked() {
    Get.back();
  }

  nextPage() {
    if (historyListVM.loading) return;
    historyListVM.nextPage().then((resp) {
      update();
    });
  }

  openHistory(MbxTransferHistoryModel dest) {
    //Get.to(MbxQRISAmountScreen(inquiry: MbxQRISInquiryModel()));
  }
}
