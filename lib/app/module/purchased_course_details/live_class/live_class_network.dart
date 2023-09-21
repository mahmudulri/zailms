import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'package:lmszai/app/utils/apiendpoint.dart';

import 'live_class_model.dart';

class LiveclassApi {
  static Future<LiveClassModel> fetchmyliveClass(String slug) async {
    print(box.read("token"));
    final String logInToken = box.read('token');

    final url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.otherendpoints.liveclass + slug);
    print(url);

    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $logInToken'});

    if (response.statusCode == 200) {
      print(response.body.toString());

      final liveclassModel =
          LiveClassModel.fromJson(json.decode(response.body));

      print(liveclassModel);

      return liveclassModel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
