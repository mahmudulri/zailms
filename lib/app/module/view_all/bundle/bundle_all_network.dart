import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/view_all/board/board_all_model.dart';

import 'bundleall_model.dart';

class BundleAllApi {
  static Future<BundleallMode> fetchCourses() async {
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/bundle-list?page=1');
    final response = await http.get(url);

    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      final bundleallmodel = BundleallMode.fromJson(json.decode(response.body));
      // print(bundleallmodel);

      return bundleallmodel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
