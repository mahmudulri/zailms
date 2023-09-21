import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/view_all/board/board_all_network.dart';
import 'board_all_model.dart';

class BoardAllController extends GetxController {
  @override
  void onInit() {
    fetchAllusers();
    super.onInit();
  }

  var isLoading = false.obs;

  var allcourses = BoardAllmodel().obs;

  void fetchAllusers() async {
    try {
      isLoading(true);
      var allcourse = await BoardAllApi.fetchCourses().then((value) {
        allcourses.value = value;
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
