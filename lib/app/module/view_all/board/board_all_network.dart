import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/view_all/board/board_all_model.dart';

class BoardAllApi {
  static Future<BoardAllmodel> fetchCourses() async {
    final url =
        Uri.parse('https://stg-lms.zainikthemes.com/api/courses-list?page=1');
    final response = await http.get(url);

    // print(jsonDecode(response.body));
    if (response.statusCode == 200) {
      print(response.body.toString());
      final boardallmodel = BoardAllmodel.fromJson(json.decode(response.body));
      print(boardallmodel);

      return boardallmodel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
