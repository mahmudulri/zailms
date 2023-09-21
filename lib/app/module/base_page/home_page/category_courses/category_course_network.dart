import 'dart:convert';
import 'package:http/http.dart' as http;

import 'category_course_model.dart';

class CategoryCourseApi {
  static Future<CategoryCourseModel> fetallCatCourse() async {
    final url = Uri.parse(
        'https://stg-lms.zainikthemes.com/api/home/category-course/development');
    final response = await http.get(url);
    // print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      final categoryCourseModel =
          CategoryCourseModel.fromJson(json.decode(response.body));
      print(categoryCourseModel);

      return categoryCourseModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
