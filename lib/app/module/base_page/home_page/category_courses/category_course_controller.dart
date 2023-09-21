import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/base_page/home_page/category_courses/category_course_network.dart';

import 'category_course_model.dart';

class CategoryCourseController extends GetxController {
  @override
  void onInit() {
    fetchInstructorData();
    super.onInit();
  }

  var isLoading = false.obs;

  var allcatcourselist = CategoryCourseModel().obs;

  void fetchInstructorData() async {
    try {
      isLoading(true);
      var catcourselist =
          await CategoryCourseApi.fetallCatCourse().then(((value) {
        allcatcourselist.value = value;

        return allcatcourselist;
      }));
      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
