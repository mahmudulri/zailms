import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lmszai/app/module/splash_screen/splash_model.dart';

class SettingApi {
  static Future<SettingModel> fetchSettings() async {
    final url = Uri.parse('https://stg-lms.zainikthemes.com/api/settings');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final settingModel = SettingModel.fromJson(json.decode(response.body));

      // print(response.body.toString());

      return settingModel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
