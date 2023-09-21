import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'package:lmszai/app/utils/apiendpoint.dart';

import 'purchased_course_model.dart';

class PurchasedCourseApi {
  static Future<PurchasedCourseDetails> fetchpurchasedCourseData(
      String slug) async {
    print("from purchased course details  " + box.read("token"));
    final String logInToken = box.read('token');

    final url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.otherendpoints.mycourses + slug);
    print(url);

    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $logInToken'});

    if (response.statusCode == 200) {
      print(response.statusCode);

      final mylearningModel =
          PurchasedCourseDetails.fromJson(json.decode(response.body));

      print(mylearningModel);

      return mylearningModel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
