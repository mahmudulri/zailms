import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/view_all/board/board_all_network.dart';

import 'upcoming_all_model.dart';
import 'upcoming_all_network.dart';

class AllUpcomingController extends GetxController {
  @override
  void onInit() {
    fetchALlcourse();
    super.onInit();
  }

  var isLoading = false.obs;

  var allupcominglist = AllUpcomingModel().obs;

  void fetchALlcourse() async {
    try {
      isLoading(true);
      var allcourse = await UpcomingAllApi.fetchCourses().then((value) {
        allupcominglist.value = value;
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
