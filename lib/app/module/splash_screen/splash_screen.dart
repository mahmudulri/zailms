import 'dart:async';
import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lmszai/app/const/color.dart';
import 'package:lmszai/app/module/base_view/base_view.dart';
import 'package:lmszai/app/module/open_screen/open_screen.dart';
import 'package:lmszai/app/module/register_screen/register_screen.dart';
import 'package:lmszai/app/routes/app_routes.dart';
import 'package:http/http.dart' as http;
import '../app_languages/applanguage_controller.dart';
import '../app_languages/applanguage_model.dart';
import '../languagedata/checker.dart';
import '../languagedata/languagecontroller.dart';
import '../sign_in_screen/sign_in_screen.dart';
import 'splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

final box = GetStorage();

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    mylandata();

    Timer(Duration(seconds: 4), () {
      if (box.read("rtlMode") == "1") {
        setState(() {
          EasyLocalization.of(context)!.setLocale(Locale('ar', 'AE'));
        });
      } else {
        setState(() {
          EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
        });
      }
    });
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 5));

    // ignore: use_build_context_synchronously

    if (box.read("token") == null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BaseView()),
      );
    }
  }

  // @override
  // void initState() {
  //   mylandata();

  //   Timer(Duration(seconds: 4), () {
  //     if (box.read("rtlMode") == "1") {
  //       setState(() {
  //         // EasyLocalization.of(context)!.setLocale(Locale('ar', 'AE'));
  //       });
  //     } else {
  //       setState(() {
  //         // EasyLocalization.of(context)!.setLocale(Locale('en', 'US'));
  //       });
  //     }
  //   });
  //   super.initState();
  // }

  mylandata() async {
    if (box.read("userLan") == null) {
      print("no data");
      getdefaultvalue();
    } else {
      print("has data");
      print(box.read("userLan"));
    }
  }

  getdefaultvalue() async {
    final url = Uri.parse('https://stg-lms.zainikthemes.com/api/languages');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      final languageModel =
          ApplanguageModel.fromJson(json.decode(response.body));
      List<dynamic> hasanData = jsonDecode(response.body)['data'];

      List<String> onDefaultIsoCodes = hasanData
          .where((lang) => lang["default_language"] == "on")
          .map<String>((lang) => lang["iso_code"] as String)
          .toList();
      // print(onDefaultIsoCodes[0]);

      List rtlMode = hasanData
          .where((lang) => lang["default_language"] == "on")
          .map<String>((lang) => lang["rtl"].toString())
          .toList();

      // print(rtlMode);

      box.write("rtlMode", rtlMode[0]);

      // box.write("flagUrl", rtlMode[0]);

      // box.write("flag_url", flagUrl[0]);

      // print(box.read("rtlMode"));

      box.write("userLan", onDefaultIsoCodes[0]);
      // print(box.read("userLan"));
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }

  final box = GetStorage();

  SplashController settingController = Get.put(SplashController());
  AppLanguageController appLanguageController =
      Get.put(AppLanguageController());

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: AppColors.scaffoldColor,
    //   ),
    // );
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      body: Center(
        child: SizedBox(
          height: screenHeight * 0.080,
          width: screenWidth * 0.500,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, sign_in_screen);
            },
            child: Image.asset(
              "assets/logo/logo.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
