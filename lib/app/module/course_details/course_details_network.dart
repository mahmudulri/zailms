import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/utils/apiendpoint.dart';
import 'package:lmszai/app/utils/apiendpoint.dart';

import '../base_page/home_page/home_page.dart';
import 'course_details.dart';
import 'course_details_controller.dart';
import 'course_details_model.dart';

class CourseDetailsApi {
  // var obj = CourseDetails();

  Future<CourseDetailsModel> fetchCourses(String slug) async {
    final box = GetStorage();

    final url = Uri.parse(
      ApiEndPoints.baseUrl + ApiEndPoints.otherendpoints.coursedetails + slug,
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("from network ..  " + response.body.toString());
      final courseDetailsModel =
          CourseDetailsModel.fromJson(json.decode(response.body));

      return courseDetailsModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
