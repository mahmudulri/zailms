import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/base_page/home_page/bundle_course/bundle_network.dart';
import 'package:lmszai/app/module/base_page/home_page/consultation/consultation_network.dart';

import 'top_instructor_network.dart';
import 'top_instructormodel.dart';

class TopinstructorController extends GetxController {
  @override
  void onInit() {
    fetchInstructorData();
    super.onInit();
  }

  var isLoading = false.obs;

  var alltopinstructorlist = TopinstructorModel().obs;

  void fetchInstructorData() async {
    try {
      isLoading(true);
      var instructorlist =
          await TopinstructorApi.fetchInstructorData().then(((value) {
        alltopinstructorlist.value = value;

        return alltopinstructorlist;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
