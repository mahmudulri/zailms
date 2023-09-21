import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/view_all/board/board_all_network.dart';
import 'package:lmszai/app/module/view_all/bundle/bundle_all_network.dart';

import 'bundleall_model.dart';

class BundleAllController extends GetxController {
  @override
  void onInit() {
    fetchAllusers();
    super.onInit();
  }

  var isLoading = false.obs;

  var allcourses = BundleallMode().obs;

  void fetchAllusers() async {
    try {
      isLoading(true);
      var allcourse = await BundleAllApi.fetchCourses().then((value) {
        allcourses.value = value;
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
