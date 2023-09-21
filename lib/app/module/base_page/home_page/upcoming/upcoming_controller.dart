import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/base_page/home_page/upcoming/upcoming_network.dart';

import 'upcoming_model.dart';
// Import the Course model

class UpcomingController extends GetxController {
  @override
  void onInit() {
    fetchAllCourses();
    super.onInit();
  }

  var isLoading = false.obs;

  var allcourses = UpcomingModel().obs;

  void fetchAllCourses() async {
    try {
      isLoading(true);
      var allcourse = await UpcomingApi.fetchCourses().then((value) {
        allcourses.value = value;
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
