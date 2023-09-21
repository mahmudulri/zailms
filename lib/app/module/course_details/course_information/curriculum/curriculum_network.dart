import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/utils/apiendpoint.dart';

import 'curriculum_model.dart';

class CurriculumApi {
  static Future<CurriculumModel> fetchCurriculumData(String slug) async {
    // String networklink =  "${ApiEndPoints.baseUrl}${ApiEndPoints.otherendpoints.coursedetails}$slug/curriculum";

    final url = Uri.parse(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.otherendpoints.coursedetails}$slug/curriculum");
    // final url = Uri.parse(
    //     "https://stg-lms.zainikthemes.com/api/course-details/JavaScript-Understanding-the-Weird-Parts/curriculum");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // print(jsonDecode(response.body));
      final curriculumModel =
          CurriculumModel.fromJson(json.decode(response.body));

      return curriculumModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
