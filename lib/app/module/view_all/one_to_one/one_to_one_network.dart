import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/view_all/board/board_all_model.dart';

import 'one_to_one_model.dart';

class OneToOneAllApi {
  static Future<OnetoOneAllmodel> fetchCourses() async {
    final url = Uri.parse(
        'https://stg-lms.zainikthemes.com/api/consultation-instructor-list?page=1');
    final response = await http.get(url);

    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print(response.body.toString());
      final allonetoOne = OnetoOneAllmodel.fromJson(json.decode(response.body));
      print(allonetoOne);

      return allonetoOne;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
