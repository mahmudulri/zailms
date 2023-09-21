import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'course_network.dart';
import 'courses_model.dart'; // Import the Course model

class CourseController extends GetxController {
  @override
  void onInit() {
    fetchAllusers();
    super.onInit();
  }

  var isLoading = false.obs;

  var allcourses = CoursesModel().obs;

  void fetchAllusers() async {
    try {
      isLoading(true);
      var allcourse = await CourseAPi.fetchCourses().then((value) {
        allcourses.value = value;
      });

      isLoading(false);
    } catch (e) {
      print(e.toString());
    }
  }
}
