import 'dart:convert';
import 'package:http/http.dart' as http;

import 'bundle_model.dart';

class BundleAPi {
  static Future<BundleModel> fetchCourses() async {
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/home/bundle-courses');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final bundleModel = BundleModel.fromJson(json.decode(response.body));
      // print(bundleModel);

      return bundleModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
