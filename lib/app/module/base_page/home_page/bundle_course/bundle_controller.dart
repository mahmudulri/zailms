import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/base_page/home_page/bundle_course/bundle_network.dart';

import 'bundle_model.dart';

class BundleController extends GetxController {
  @override
  void onInit() {
    fetchallBundles();
    super.onInit();
  }

  var isLoading = false.obs;

  var allbundlelist = BundleModel().obs;

  void fetchallBundles() async {
    try {
      isLoading(true);
      var mybundles = await BundleAPi.fetchCourses().then(((value) {
        allbundlelist.value = value;

        return allbundlelist;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
