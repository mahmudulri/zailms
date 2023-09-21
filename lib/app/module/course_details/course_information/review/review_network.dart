import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/utils/apiendpoint.dart';

import 'review_model.dart';

class ReviewApi {
  static Future<ReviewModel> fetchReviewData(String slug) async {
    final url = Uri.parse(
        "${ApiEndPoints.baseUrl}${ApiEndPoints.otherendpoints.coursedetails}$slug/review");
    // final url = Uri.parse(
    //     "https://stg-lms.zainikthemes.com/api/course-details/JavaScript-Understanding-the-Weird-Parts/curriculum");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body.toString());
      // print(jsonDecode(response.body));
      final reviewModel = ReviewModel.fromJson(json.decode(response.body));

      return reviewModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
