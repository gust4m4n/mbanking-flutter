import 'all_widgets.dart';

extension Loading on GetInterface {
  void loading() {
    Get.dialog(
        AlertDialog(
          elevation: 0.0,
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          content: const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(ColorX.white)),
          ),
        ),
        transitionDuration: Duration.zero,
        transitionCurve: null);
  }
}
