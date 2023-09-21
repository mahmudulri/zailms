import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../utils/apiendpoint.dart';
import 'intructor_model.dart';

class CourseIntructorApi {
  static Future<CourseInstructorModel> fetchInstructorData(String slug) async {
    final url = Uri.parse(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.otherendpoints.coursedetails}$slug/instructor");
    // final url = Uri.parse(
    //     'https://stg-lms.zainikthemes.com/api/course-details/PHP-for-Beginners-Become-a-PHP-Master-CMS-Project/instructor');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body.toString());
      print(response.body.toString());
      final instructorModel =
          CourseInstructorModel.fromJson(json.decode(response.body));
      // print(instructorModel);

      return instructorModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
