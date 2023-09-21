import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/base_page/home_page/upcoming/upcoming_model.dart';

class UpcomingApi {
  static Future<UpcomingModel> fetchCourses() async {
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/home/upcoming-courses');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      final upcomingModel = UpcomingModel.fromJson(json.decode(response.body));
      // print(upcomingModel);

      // print(response.body.toString());

      return upcomingModel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
