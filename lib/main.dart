import 'package:mbankingflutter/views/mbx_news_screen/mbx_news_screen.dart';
import 'package:mbankingflutter/views/mbx_privacy_policy_screen/mbx_privacy_policy_screen.dart';
import 'package:mbankingflutter/views/mbx_receipt_screen/mbx_receipt_screen.dart';
import 'package:mbankingflutter/views/mbx_relogin_screen/mbx_relogin_screen.dart';
import 'package:mbankingflutter/views/mbx_tnc_screen/mbx_tnc_screen.dart';

import 'viewmodels/mbx_anti_jailbreak_vm.dart';
import 'viewmodels/mbx_preferences_vm+users.dart';
import 'viewmodels/mbx_preferences_vm.dart';
import 'viewmodels/mbx_profile_vm.dart';
import 'viewmodels/mbx_reachability_vm.dart';
import 'views/mbx_bottom_navbar_screen/mbx_bottom_navbar_screen.dart';
import 'views/mbx_login_screen/mbx_login_screen.dart';
import 'widgets/all_widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MbxAntiJailbreakVM.check();
  MbxReachabilityVM.startListening();

/*
// TESTXXXX
  var dir = await getApplicationDocumentsDirectory();
  dir.createSync(recursive: true);
  var file = File('${dir.absolute.path}\ZZZ.TXT');
  file.writeAsStringSync('ABCDEFHJ');
  */

  final freshInstall = await MbxPreferencesVM.getFreshInstall();
  if (freshInstall == true) {
    await MbxPreferencesVM.setFreshInstall(false);
    await MbxUserPreferencesVM.resetAll();
  }

  final theme = await MbxUserPreferencesVM.getTheme();
  if (theme.isNotEmpty) {
    ColorX.theme = hexToColor(await MbxUserPreferencesVM.getTheme());
  } else {
    ColorX.theme = Color(0xfff44336);
    final hex = '#${ColorX.theme.value.toRadixString(16)}';
    MbxUserPreferencesVM.setTheme(hex);
  }
  await MbxProfileVM.load();

  String initialRoute = '/login';
  final token = await MbxUserPreferencesVM.getToken();
  if (token.isNotEmpty) {
    initialRoute = '/home';
  }

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    runApp(
      ContainerX(
        backgroundColor: ColorX.white,
        child: Center(
          child: Container(
            width: kIsWeb ? 400.0 : double.infinity,
            child: MyApp(initialRoute),
          ),
        ),
      ),
    );
  });
/*
  if (MbxSessionVM.token.isNotEmpty) {
    MbxSessionVM.checkPinAndBiometric();
  } */

/*
  final inquiryVM = MbxQRISInquiryVM();
  inquiryVM.request(qr_code: '').then((resp) {
    if (resp.status == 200) {
      Get.to(MbxQRISAmountScreen(inquiry: inquiryVM.inqury))?.then((value) {});
    }
  }); */
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  MyApp(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      popGesture: true,
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      scrollBehavior: AppScrollBehavior(),
      title: 'MBanking-flutter',
      theme: ThemeData(
          bottomSheetTheme:
              BottomSheetThemeData(surfaceTintColor: Colors.white),
          textSelectionTheme: TextSelectionThemeData(
            selectionColor: ColorX.lightGray,
            selectionHandleColor: ColorX.gray,
          ),
          splashColor: Colors.transparent,
          visualDensity: VisualDensity.standard,
          primarySwatch: Colors.grey,
          fontFamily: 'Roboto',
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          })),
      initialRoute: initialRoute,
      getPages: [
        GetPage(
            name: '/login',
            page: () => MbxLoginScreen(),
            transition: Transition.noTransition),
        GetPage(
            name: '/relogin',
            page: () => MbxReloginScreen(),
            transition: Transition.noTransition),
        GetPage(name: '/home', page: () => MbxBottomNavBarScreen()),
        GetPage(name: '/tnc', page: () => MbxTncScreen()),
        GetPage(name: '/privacy', page: () => MbxPrivacyPolicyScreen()),
        GetPage(name: '/news', page: () => MbxNewsScreen()),
        GetPage(name: '/receipt', page: () => MbxReceiptScreen()),
      ],
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
