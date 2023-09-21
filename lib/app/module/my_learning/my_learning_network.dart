import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/sign_in_screen/sign_in_screen.dart';
import 'package:lmszai/app/utils/apiendpoint.dart';

import 'my_learning_model.dart';

class MylearningApi {
  static Future<MyLearningModel> fetchMylarningData() async {
    print(box.read("token"));
    final String logInToken = box.read('token');

    final url = Uri.parse(
        ApiEndPoints.baseUrl + ApiEndPoints.otherendpoints.mylearning);

    var response =
        await http.get(url, headers: {'Authorization': 'Bearer $logInToken'});

    if (response.statusCode == 200) {
      // print(response.body.toString());

      final mylearningModel =
          MyLearningModel.fromJson(json.decode(response.body));

      print(mylearningModel);

      return mylearningModel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
