import 'dart:convert';
import 'package:http/http.dart' as http;

import 'courses_model.dart';

class CourseAPi {
  static Future<CoursesModel> fetchCourses() async {
    final url = Uri.parse('https://stg-lms.zainikthemes.com/api/home/courses');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body.toString());
      final coursesModel = CoursesModel.fromJson(json.decode(response.body));

      // print(response.body.toString());

      return coursesModel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
