import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'applanguage_model.dart';

class AppLanApi {
  static Future<ApplanguageModel> fetchLanData() async {
    final box = GetStorage();
    final url = Uri.parse('https://stg-lms.zainikthemes.com/api/languages');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final languageModel =
          ApplanguageModel.fromJson(json.decode(response.body));
      List<dynamic> hasanData = jsonDecode(response.body)['data'];

      List<String> onDefaultIsoCodes = hasanData
          .where((lang) => lang["default_language"] == "on")
          .map<String>((lang) => lang["iso_code"] as String)
          .toList();

      List<String> defaultflagUrl = hasanData
          .where((lang) => lang["default_language"] == "on")
          .map<String>((lang) => lang["flag_url"] as String)
          .toList();

      box.write("flagUrl", defaultflagUrl[0]);

      // print(languageModel.toJson());

      // print("from app lan network " + onDefaultIsoCodes[0]);

      // box.write("defaultLanguage", onDefaultIsoCodes[0]);

      // print("from app lan network box " + box.read("defaultLanguage"));

      // print(mydata[0]);

      // print(hasanData);

      return languageModel;
    } else {
      print("Error");
      throw Exception('Failed to fetch courses');
    }
  }
}
