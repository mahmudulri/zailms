import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/view_all/board/board_all_model.dart';

import 'all_top_instructor_model.dart';

class TopinstructorApi {
  static Future<AllTopInstructorModel> fetchInstructorlist() async {
    final url = Uri.parse(
        'https://stg-lms.zainikthemes.com/api/instructor-list?page=1');
    final response = await http.get(url);

    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print(response.body.toString());
      final alltopinstructor =
          AllTopInstructorModel.fromJson(json.decode(response.body));
      print(alltopinstructor);

      return alltopinstructor;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
