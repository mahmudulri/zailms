import 'dart:convert';
import 'package:http/http.dart' as http;

import 'top_instructormodel.dart';

class TopinstructorApi {
  static Future<TopinstructorModel> fetchInstructorData() async {
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/home/instructors');
    final response = await http.get(url);
    // print(jsonDecode(response.body));

    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      print(response.body.toString());
      final instructorModel =
          TopinstructorModel.fromJson(json.decode(response.body));
      // print(instructorModel);

      return instructorModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
