import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lmszai/app/draft.dart';
import 'package:lmszai/app/module/base_page/home_page/consultation/consultview.dart';
import 'package:lmszai/app/module/base_page/home_page/categories/categoryview.dart';
import 'package:lmszai/app/module/course_details/course_details.dart';
import 'package:lmszai/app/module/languagedata/languageview.dart';
import 'package:lmszai/app/module/leader_board/leader_board.dart';
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'app/module/base_page/home_page/top_instructor/topninstructorview.dart';
import 'app/module/base_view/base_view.dart';
import 'app/module/splash_screen/splash_screen.dart';
import 'app/routes/app_routes.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_routes.dart';
import 'app/test_folder/couse/courseview.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'AE'),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // getPages: getPages,
      // initialRoute: base_view,
      debugShowCheckedModeBanner: false,
      home: Startpage(),
    );
  }
}

class Startpage extends StatelessWidget {
  Startpage({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: TopinsView(),
      initialRoute: splash,
      routes: mypagemap,
    );
  }
}
