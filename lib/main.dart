import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/utils/color/kcolors.dart';
import 'package:loan_app/utils/text_utils/k_text_styles.dart';
import 'package:loan_app/utils/text_utils/text_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: KColors.primary, // status bar color
    ),
  );
  await GetStorage.init();
  await Future.delayed(const Duration(milliseconds: 300));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 760),
      builder: (_, child) => GetMaterialApp(
        title: 'Loan App',
        builder: (ctx, widget) {
          ScreenUtil.init(ctx);
          return MediaQuery(
            data: MediaQuery.of(ctx)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: widget!,
          );
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: KColors.primary,
            surfaceTint: KColors.white,
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: KColors.background,
            surfaceTintColor: KColors.white,
            shape: RoundedRectangleBorder(),
          ),
          fontFamily: KFontFamily.poppins,
          scaffoldBackgroundColor: KColors.background,
          useMaterial3: true,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0,
            surfaceTintColor: KColors.white,
            backgroundColor: KColors.primary,
            titleTextStyle: KTextStyles.appbarTitle,
            iconTheme: IconThemeData(
              size: 18.sp,
              color: KColors.white,
            ),
          ),
        ),
        initialRoute: Routes.appOppeningPage,
        getPages: Routes.list,
        navigatorKey: Get.key,
      ),
    );
  }
}
