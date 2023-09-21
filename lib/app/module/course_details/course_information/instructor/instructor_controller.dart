import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/course_details/course_information/instructor/instructor_network.dart';

import 'intructor_model.dart';

class CourseInstructorController extends GetxController {
  var isLoading = false.obs;

  var alltopinstructorlist = CourseInstructorModel().obs;

  void fetchInstructorData(String slug) async {
    try {
      isLoading(true);
      var instructorlist =
          await CourseIntructorApi.fetchInstructorData(slug).then(((value) {
        alltopinstructorlist.value = value;

        return alltopinstructorlist;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
