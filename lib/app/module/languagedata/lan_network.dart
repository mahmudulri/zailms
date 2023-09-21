import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'languagemodel.dart';

class LanguApi {
  static Future<LanguageModel> fetchLanguages() async {
    final box = await GetStorage();
    // print("from lan net to " + box.read("defaultLanguage"));

    String lanData = box.read("userLan");

    final url = await Uri.parse(
        'https://stg-lms.zainikthemes.com/api/language-data/${box.read("userLan")}');

    // final url = await Uri.parse(
    //     'https://stg-lms.zainikthemes.com/api/language-data/en');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final languageModel = LanguageModel.fromJson(json.decode(response.body));
      // print("from Lan network " + box.read("defaultLanguage"));
      // print(languageModel.toJson());

      return languageModel;
    } else {
      throw Exception('Failed to fetch courses');
    }
  }
}
