import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/app_languages/applanguage_network.dart';
import 'package:lmszai/app/module/base_page/home_page/bundle_course/bundle_network.dart';

import 'applanguage_model.dart';

class AppLanguageController extends GetxController {
  final box = GetStorage();

  @override
  void onInit() {
    fetchLanguageData();
    super.onInit();
  }

  var isLoading = false.obs;

  var allLanguagelist = ApplanguageModel().obs;

  void fetchLanguageData() async {
    try {
      isLoading(true);
      var mylanguages = await AppLanApi.fetchLanData().then(((value) {
        allLanguagelist.value = value;

        // print(allLanguagelist.value.data!.length.toString());

        return allLanguagelist;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
