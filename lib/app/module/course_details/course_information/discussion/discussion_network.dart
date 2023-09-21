import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/utils/apiendpoint.dart';

import 'discussion_model.dart';

class DiscussionApi {
  static Future<DiscussionModel> fetchDiscussionData(String slug) async {
    // String networklink =  "${ApiEndPoints.baseUrl}${ApiEndPoints.otherendpoints.coursedetails}$slug/curriculum";

    final url = Uri.parse(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.otherendpoints.coursedetails}$slug/discussion");
    // final url = Uri.parse(
    //     "https://stg-lms.zainikthemes.com/api/course-details/JavaScript-Understanding-the-Weird-Parts/discussion");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body.toString());
      final discussionModel =
          DiscussionModel.fromJson(json.decode(response.body));

      return discussionModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
