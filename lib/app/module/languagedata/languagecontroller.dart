import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'lan_network.dart';
import 'languagemodel.dart';

class LanguController extends GetxController {
  @override
  void onInit() {
    fetchFinalData();
    super.onInit();
  }

  var isLoading = false.obs;

  var allLanguages = LanguageModel().obs;

  Future<void> fetchFinalData() async {
    try {
      print(isLoading);
      isLoading(true);
      print(isLoading);
      var languages = await LanguApi.fetchLanguages().then((value) {
        allLanguages.value = value;
        // print(allLanguages);
        isLoading(false);
        print(isLoading);
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
