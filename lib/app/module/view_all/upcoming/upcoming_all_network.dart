import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/view_all/board/board_all_model.dart';

import 'upcoming_all_model.dart';

class UpcomingAllApi {
  static Future<AllUpcomingModel> fetchCourses() async {
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/upcoming-list?page=1');
    final response = await http.get(url);

    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      final upcomingall = AllUpcomingModel.fromJson(json.decode(response.body));
      print(upcomingall);

      return upcomingall;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
