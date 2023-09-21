import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/view_all/board/board_all_network.dart';

import 'all_top_instructor_model.dart';
import 'top_instructor_all_network.dart';

class AllinstructorController extends GetxController {
  @override
  void onInit() {
    fetchAllusers();
    super.onInit();
  }

  var isLoading = false.obs;

  var allinstructorData = AllTopInstructorModel().obs;

  void fetchAllusers() async {
    try {
      isLoading(true);
      var allcourse =
          await TopinstructorApi.fetchInstructorlist().then((value) {
        allinstructorData.value = value;
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
